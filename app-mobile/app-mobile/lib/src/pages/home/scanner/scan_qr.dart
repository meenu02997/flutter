import 'dart:convert';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilunch/src/localization/app_translation.dart';
import 'package:ilunch/src/pages/home/help/help_page.dart';
import 'package:ilunch/src/services/scan_api_client.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/utils/helper_function.dart';
import 'package:ilunch/src/widgets/triangle_clipper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan_preview/scan_preview_widget.dart';

import '../dashboard.dart';

class ScanQRpage extends StatefulWidget {
  @override
  ScanQRpageState createState() => ScanQRpageState();
}

class ScanQRpageState extends State<ScanQRpage> {
  Barcode result;
  bool isResultShown = false;
  int count = -1;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool _isLoading = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
    _showCountApi();
    if(Platform.isAndroid)
      _requestPermission();
  }

  _requestPermission() async {
    var status = await Permission.camera.request();
    print(status);
    if (Platform.isIOS && (status.isDenied || status.isPermanentlyDenied)) {
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            content: Text(
                AppTranslations.of(context).text('camera_access')),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(AppTranslations.of(context).text('deny')),
                onPressed: () => Navigator.of(context).pop(),
              ),
              CupertinoDialogAction(
                child: Text(AppTranslations.of(context).text('settings')),
                onPressed: () => openAppSettings(),
              ),
            ],
          ));
    }
  }

  @override
  Widget build(BuildContext ctx) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 280.0
        : 400.0;
    return ModalProgressHUD(
        dismissible: false,
        opacity: 0,
        inAsyncCall: _isLoading,
        child: Stack(
          children: <Widget>[
            _scannerView(),
            Center(
              child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppTranslations.of(context).text('qr_header'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'young'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        AppTranslations.of(context).text('qr_sub_header'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'averta_semibold'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: SizedBox(
                        height: 320,
                        width: scanArea,
                      )),
                      Container(
                        padding: EdgeInsets.only(bottom: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/ques.svg',
                              width: 18,
                              height: 18,
                              color: Colors.white,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HelpPage()),
                                )
                              },
                              child: Text(
                                AppTranslations.of(context).text('help'),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: 'averta_semibold'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            count != -1 ? _showPopup() : SizedBox()
          ],
        ));
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 280.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      // You can choose between CameraFacing.front or CameraFacing.back. Defaults to CameraFacing.back
      // cameraFacing: CameraFacing.front,
      onQRViewCreated: _onQRViewCreated,
      // Choose formats you want to scan. Defaults to all formats.
      formatsAllowed: [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderRadius: 0,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      if (!isResultShown) {
        _parseQRvalue(scanData.code);
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _modalBottomSheetMenu(
      String heading, String subHeading, double height, int isError) {
    setState(() {
      isResultShown = true;
    });
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return new Container(
          height: height,
          width: double.infinity,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
              padding: EdgeInsets.all(15.0),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Align(
                      child: Icon(
                        Icons.close,
                        size: 25,
                        color: HexColor(appGreen),
                      ),
                      alignment: Alignment.centerRight,
                    ),
                    onTap: () => {
                      Navigator.pop(context),
                      isResultShown = false,
                      // ignore: sdk_version_ui_as_code
                      if (Platform.isAndroid)
                        {
                          Navigator.of(context).pop(),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashBoardPage()),
                          )
                        }
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        heading,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'averta_bold',
                            color: HexColor('#1a2c2e')),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            subHeading,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'averta-regular',
                                color: HexColor('#7e7e7e')),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          isError == 2
                              ? SizedBox()
                              : isError == 1
                                  ? SvgPicture.asset(
                                      'assets/images/check.svg',
                                      width: 16,
                                      height: 16,
                                      fit: BoxFit.contain,
                                    )
                                  : Image(
                                      image:
                                          AssetImage('assets/images/close.png'),
                                      width: 22,
                                      height: 22,
                                    ),
                        ],
                      )
                    ],
                  ),
                ],
              )),
        );
      },
    ).whenComplete(() {
      setState(() {
        isResultShown = false;
        if (Platform.isAndroid) {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashBoardPage()),
          );
        }
      });
    });
  }

  Future<void> _refundBoxApi(String boxId, String suffix) async {
    setState(() {
      _isLoading = true;
      isResultShown = true;
    });
    String token = await HelperFunction.getUserToken();
    String identifier = await HelperFunction.getUserIDSharedPreference();
    await ScanApiClient().refundBoxApi({
      "box[identifier]": identifier,
      "box[box]": boxId,
      "box[suffix]": suffix
    }, token).then((response) async {
      _playAudio('assets/music/liva_notification.mp3');
      setState(() {
        _isLoading = false;
        _showCountApi();
        _modalBottomSheetMenu(
            AppTranslations.of(context).text('valid_qr_heading'),
            AppTranslations.of(context).text('valid_qr_sub'),
            140.0,
            1);
      });
    }).catchError((error) {
      _playAudio('assets/music/error.mp3');
      setState(() {
        _isLoading = false;
      });
      if (error['status'].toString() == 'already_scan') {
        _modalBottomSheetMenu(
            AppTranslations.of(context).text('already_scanned_heading'),
            AppTranslations.of(context).text('already_scanned_sub_heading'),
            165.0,
            2);
      } else {
        returnInvalidMessage();
      }
    });
  }

  Future<void> _showCountApi() async {
    setState(() {
      _isLoading = true;
    });
    String token = await HelperFunction.getUserToken();
    String identifier = await HelperFunction.getUserIDSharedPreference();
    await ScanApiClient().getBoxCount({
      "user[identifier]": identifier,
    }, token).then((response) async {
      print(response);
      setState(() {
        _isLoading = false;
        count = response['count'];
      });
    }).catchError((error) {
      // setState(() {
      //   _isLoading = false;
      // });
    });
  }

  Widget _showPopup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          children: [
            Container(
                width: double.infinity,
                margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 90, top: 5),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  border: Border.all(
                      width: 3,
                      color: Colors
                          .white //                   <--- border width here
                      ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/images/count.svg',
                            width: 29,
                            height: 29,
                            color: Colors.black,
                            fit: BoxFit.contain,
                          ),
                          Container(
                            width: 15,
                            height: 15,
                            margin: EdgeInsets.only(left: 6.5),
                            padding: EdgeInsets.only(top: 1.5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.5),
                              color: HexColor(appGreen),
                            ),
                            child: Text(
                              count.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontFamily: 'averta_semibold'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      count == 0
                          ? Text(
                              '${AppTranslations.of(context).text('no_box')}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'averta_regular'),
                            )
                          : RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: new TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontFamily: 'averta_regular'),
                                children: <TextSpan>[
                                  new TextSpan(
                                    text:
                                        '${AppTranslations.of(context).text('you_have')}',
                                  ),
                                  new TextSpan(
                                      text:
                                          '${count.toString()}${AppTranslations.of(context).text('box')}',
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'averta_bold',
                                          fontWeight: FontWeight.bold,
                                          color: HexColor(appGreen))),
                                  new TextSpan(
                                      text:
                                          '${AppTranslations.of(context).text('to_return')}',
                                      style: TextStyle(
                                          fontFamily: 'averta_regular')),
                                ],
                              ),
                            ),
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 55),
              child: Center(
                child: ClipPath(
                  clipper: TriangleClipper(),
                  child: Container(
                    color: Colors.white,
                    height: 10,
                    width: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _scannerView() {
    if (Platform.isAndroid) {
      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ScanPreviewWidget(
          onScanResult: (result) {
            if (!isResultShown) {
              _parseQRvalue(result.toString());
            }
          },
        ),
      );
    } else {
      return _buildQrView(context);
    }
  }

  void _parseQRvalue(String code) {
    try {
      Map<String, dynamic> response = jsonDecode(code);
      if (response == null ||
          response['identifier'] == null ||
          response['identifier'].toString().length == 0 ||
          response['suffix'] == null) {
        _playAudio('assets/music/error.mp3');
        return returnInvalidMessage();
      }
      _refundBoxApi(response['identifier'], response['suffix']);
    } catch (e) {
      _playAudio('assets/music/error.mp3');
      return returnInvalidMessage();
    }
  }

  void returnInvalidMessage() {
    _modalBottomSheetMenu(
        AppTranslations.of(context).text('invalid_qr_heading'),
        AppTranslations.of(context).text('invalid_qr_sub'),
        140.0,
        0);
  }

  void _playAudio(path) {
    AssetsAudioPlayer.newPlayer().open(
      Audio(path),
      autoStart: true,
    );
  }
}
