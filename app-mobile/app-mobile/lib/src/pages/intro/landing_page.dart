import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilunch/src/localization/app_translation.dart';
import 'package:ilunch/src/pages/onboarding/login_page.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/widgets/rounded_button.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
              elevation: 0,
              brightness:Brightness.dark
          ),
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              colorFilter: new ColorFilter.mode(
                  Colors.transparent.withOpacity(0.2), BlendMode.exclusion),
              fit: BoxFit.fitHeight,
            )),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    child: SvgPicture.asset(
                      'assets/images/logo_fr.svg',
                      width: 86,
                      height: 120,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                      AppTranslations.of(context).text('welcome_heading'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24, color: Colors.white, fontFamily: 'young'),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.only(top: 20, bottom: 40, left: 20, right: 20),
                  child: RoundedButton(
                    text: AppTranslations.of(context).text('login_in'),
                    radius: 30,
                    kind: RoundedButtonKind.filled,
                    contrastColor: Colors.black,
                    color: Colors.white,
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      )
                    },
                  ),
                ),
                /*Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: RoundedButton(
                text: AppTranslations.of(context).text('login_in'),
                radius: 30,
                kind: RoundedButtonKind.outline,
                contrastColor: Colors.transparent,
                color: Colors.white,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  )
                },
              ),
            ),*/
              ],
            ),
          )),
    );
  }
}
