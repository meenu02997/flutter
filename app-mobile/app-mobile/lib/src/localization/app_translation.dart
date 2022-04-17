import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'localized_strings.dart';

class AppTranslations with LocalizedStrings {
  AppTranslations(this.locale);

  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  static AppTranslations of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }
 // loading the language as per locale
  static Future<AppTranslations> load(Locale locale) async {
    final appTranslations = AppTranslations(locale);
    print(locale);
    final jsonContent = await rootBundle
        .loadString('assets/strings/${locale.languageCode}.json');
    _localizedValues = json.decode(jsonContent);
    return appTranslations;
  }

  String get currentLanguage => locale.languageCode;

  // providing the string value in current language
  String text(String key) {
    return _localizedValues[key] ?? '$key not found';
  }
}
