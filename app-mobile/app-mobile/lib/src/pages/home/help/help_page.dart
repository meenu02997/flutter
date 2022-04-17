import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ilunch/src/localization/app_translation.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/widgets/base_widget.dart';
import 'package:ilunch/src/widgets/rounded_button.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor(loginBackground),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        backgroundColor: HexColor(loginBackground),
        body: BaseWidget(
            backIcon: true,
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: ListView(
                children: [
                  SizedBox(
                    height: 43,
                  ),
                  Image(
                    image: AssetImage('assets/images/help.png'),
                    width: 90,
                    height: 120,
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Text(
                    AppTranslations.of(context).text('help_heading'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: HexColor('#000000'),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'young'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(AppTranslations.of(context).text('help_sub_heading'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: HexColor('#7e7e7e'),
                        fontSize: 14,
                        fontFamily: 'averta-regular',
                      )),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 16),
                      child: RoundedButton(
                        text: AppTranslations.of(context).text('email_us'),
                        radius: 30,
                        kind: RoundedButtonKind.outline,
                        contrastColor: Colors.transparent,
                        color: HexColor('#b4b4b4'),
                        onPressed: () => {_openUrl()},
                      )),
                  InkWell(
                    onTap: () => {
                      Navigator.pop(context),
                    },
                    child: Text(AppTranslations.of(context).text('later'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: HexColor(appGreen),
                          fontSize: 16,
                          fontFamily: 'averta-regular',
                        )),
                  ),
                ],
              ),
            )));
  }

  Future<void> _openUrl() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'contact@i-lunch.fr',
      query: 'subject=App Feedback', //add subject and body here
    );
    var url = params.toString();
    await launch(url);
  }
}
