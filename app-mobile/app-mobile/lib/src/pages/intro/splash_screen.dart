import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilunch/src/pages/home/dashboard.dart';
import 'package:ilunch/src/pages/intro/introduction_page.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/utils/helper_function.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = '';

  @override
  void initState() {
    super.initState();
    fetchToken();
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return _showSplashScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return IntroductionPage();
        break;
      case AuthStatus.LOGGED_IN:
        return DashBoardPage();
        break;
      default:
        return _showSplashScreen();
    }
  }

  Widget _showSplashScreen() {
    return Scaffold(
        backgroundColor: HexColor(appGreen),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child:Stack(
          children: [
            Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  SvgPicture.asset(
                    'assets/images/logo_fr.svg',
                    width: 86,
                    height: 120,
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ])),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 110),
              child: SizedBox(
                width: 21,
                height: 21,
                child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.white)),
              ),
            )
          ],
        )));
  }

  void fetchToken() async {
    String token = await HelperFunction.getUserToken();
    print(token);
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        authStatus = token == null || token.length == 0
            ? AuthStatus.NOT_LOGGED_IN
            : AuthStatus.LOGGED_IN;
      });
    });
  }
}
