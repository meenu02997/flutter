import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ilunch/src/localization/app_translation.dart';
import 'package:ilunch/src/pages/intro/landing_page.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/widgets/rounded_button.dart';
import 'package:ilunch/src/widgets/tutorial_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/color_converter_utils.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: PageView(
                      controller: _controller,
                      children: <Widget>[
                        TutorialPage(
                          controller: _controller,
                          title: AppTranslations.of(context).text('tut_one'),
                          buttonTitle: AppTranslations.of(context).text('next'),
                          image: 'assets/images/tut_one.png',
                          margin: 40,
                        ),
                        TutorialPage(
                          controller: _controller,
                          title: AppTranslations.of(context).text('tut_second'),
                          buttonTitle: AppTranslations.of(context).text('next'),
                          image: 'assets/images/tuto.png',
                          margin: 0,
                        ),
                      ],
                    ),
                  ),
                  Column(
                        children: [
                    Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 10),
                    child: RoundedButton(
                            text: AppTranslations.of(context).text('next'),
                            radius: 30,
                            kind: RoundedButtonKind.filled,
                            contrastColor: Colors.white,
                            color: HexColor(appGreen),
                            onPressed: () => {
                              if (_controller.page == 0.0)
                                {
                                  _controller.animateToPage(1,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease)
                                }
                              else
                                {
                                  Navigator.pop(context),
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LandingPage()),
                                  )
                                }
                            },
                          )),
                          Container(
                              alignment: Alignment.bottomCenter,
                              margin: new EdgeInsets.only(
                                bottom: 30.0,
                              ),
                              child: SmoothPageIndicator(
                                controller: _controller,
                                count: 2,
                                effect: SlideEffect(
                                  spacing: 8.0,
                                  radius: 5.0,
                                  dotWidth: 10.0,
                                  dotHeight: 10.0,
                                  dotColor: Color(0xffe7ded1),
                                  activeDotColor: HexColor(appGreen),
                                ),
                              ))
                        ],
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
