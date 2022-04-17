import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ilunch/src/pages/intro/splash_screen.dart';

import 'src/localization/app_translation_delegate.dart';
import 'src/localization/lang_config.dart';
import 'src/utils/color_converter_utils.dart';
import 'src/utils/color_utils.dart';
import 'src/utils/font_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(
      MaterialApp(
          theme: ThemeData(
              fontFamily: fontFamilyName,
              //canvasColor: Colors.transparent,
              visualDensity: VisualDensity.adaptivePlatformDensity,),
          debugShowCheckedModeBanner: false,
          // List all of the app's supported locales here
          supportedLocales: appSupportedLocales,
          // These delegates make sure that the localization data for the proper language is loaded
          // ignore: prefer_const_literals_to_create_immutables
          localizationsDelegates: [
            // A class which loads the translations from JSON files
            const AppTranslationsDelegate(),
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,
          ],
          // Returns a locale which will be used by the app
          localeResolutionCallback: (locale, supportedLocales) {
            // Check if the current device locale is supported
            for (final supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          //TO DO: this need to be replaced with router config
          home: SplashScreen()));
}
