import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ilunch/src/utils/color_utils.dart';

import 'app_colors.dart';
import 'color_converter_utils.dart';

final bool isIOS = Platform.isIOS;

bool get isWeb => kIsWeb;

bool get isMobile => !isWeb && (Platform.isIOS || Platform.isAndroid);

bool get isDesktop =>
    !isWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

bool get isApple => !isWeb && (Platform.isIOS || Platform.isMacOS);

bool get isGoogle => !isWeb && (Platform.isAndroid || Platform.isFuchsia);

class TextStyles {
  static bool isSmallScreen = false;
  static bool isBigScreen = false;
  static const smallHeightParameterInPixels = 700;

  static void setScreenSize(bool isSmall) {
    isSmallScreen = isSmall;
    isBigScreen = !isSmall;
  }
}

const tsBoldButtonBlack20 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 20.0,
    fontWeight: FontWeight.w500);

const tsMediumTextBlack50Primary14 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 14.0,
    fontWeight: FontWeight.w500);
const tsSemiMediumTextBlack50Primary16 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 14.0,
    fontWeight: FontWeight.w600);
const tsMediumTextBlack50Primary16 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 16.0,
    fontWeight: FontWeight.w600);
const tsMediumTextDarkBlack50Primary14 = TextStyle(
    color: AppColors.dark_grey_blue,
    fontFamily: 'averta',
    fontSize: 14.0,
    fontWeight: FontWeight.w500);
const tsMediumTextDarkBold28 = TextStyle(
    color: AppColors.dark_grey_blue,
    fontFamily: 'averta',
    fontSize: 28.0,
    fontWeight: FontWeight.w700);
const tsMediumTextDarkBold23 = TextStyle(
    color: AppColors.dark_grey_blue,
    fontFamily: 'averta',
    fontSize: 23.0,
    fontWeight: FontWeight.w700);

const tsSemiBoldTextDarkGrey18 = TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
  fontFamily: 'averta',
);
const tsSemiBoldTextDarkGrey16 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 16.0,
    fontWeight: FontWeight.w600);

const tsSemiBoldTextDarkGrey20 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 20.0,
    fontWeight: FontWeight.w600);

const tsSemiBoldTextDarkGrey15 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 15.0,
    fontWeight: FontWeight.w600);
const tsSemiBoldTextDarkGrey13 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 13.0,
    fontWeight: FontWeight.w600);
const tsSemiBoldTextDarkGrey14 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 14.0,
    fontWeight: FontWeight.w600);

const tsBoldTextWhite14 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 14.0,
    fontWeight: FontWeight.w700);
const tsBoldTextBlack14 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 14.0,
    fontWeight: FontWeight.w700);
const tsBoldTextBlack16 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 16.0,
    fontWeight: FontWeight.w600);
const tsBoldTextBlack18 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 18.0,
    fontWeight: FontWeight.w700);
const tsBoldTextWhite13 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 13.0,
    fontWeight: FontWeight.w500);

const tsMediumTextWhite14 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 14.0,
    fontWeight: FontWeight.w500);
const tsMediumTextGrey16 = TextStyle(
    color: Colors.white54,
    fontFamily: 'averta',
    fontSize: 16.0,
    fontWeight: FontWeight.w500);
const tsMediumTextGrey14 = TextStyle(
    color: Colors.white54,
    fontFamily: 'averta',
    fontSize: 14.0,
    fontWeight: FontWeight.w500);
const tsMediumTextRed12 = TextStyle(
    color: AppColors.snackBarRed,
    fontFamily: 'averta',
    fontSize: 12.0,
    fontWeight: FontWeight.w500);
const tsMediumTextGrey12 = TextStyle(
    color: AppColors.training_color_9,
    fontFamily: 'averta',
    fontSize: 12.0,
    fontWeight: FontWeight.w500);
const tsMediumTextWhite14tsMediumTextYellow14 = TextStyle(
    color: Colors.yellow,
    fontFamily: 'averta',
    fontSize: 14.0,
    fontWeight: FontWeight.w500);
const tsMediumTextGreen14 = TextStyle(
    color: AppColors.greenColor,
    fontFamily: 'averta',
    fontSize: 14.0,
    fontWeight: FontWeight.w500);
const tsMediumTextWhite12 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 12.0,
    fontWeight: FontWeight.w500);
const tsMediumTextBlack12 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 12.0,
    fontWeight: FontWeight.w500);
const tsMediumTextBlack10 = TextStyle(
    color: AppColors.training_color_9,
    fontFamily: 'averta',
    fontSize: 10.0,
    fontWeight: FontWeight.w500);
const tsMediumTextWhite8 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 8.0,
    fontWeight: FontWeight.w500);
const tsMediumTextWhiteUnderLine14 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 14.0,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w500);
const tsMediumTextYellowUnderLine14 = TextStyle(
    color: Colors.yellow,
    fontFamily: 'averta',
    fontSize: 14.0,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w500);
const tsMediumTextGreenUnderLine14 = TextStyle(
    color: Color(0xFF59ac51),
    fontFamily: 'averta',
    fontSize: 14.0,
    fontWeight: FontWeight.w500);

const tsMediumTextWhite13 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 13.0,
    fontWeight: FontWeight.w500);
const tsMediumTextWhite16 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 16.0,
    fontWeight: FontWeight.w500);

const tsBoldTextWhite22 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 22.0,
    fontWeight: FontWeight.w700);

const tsBoldTextWhite28 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 28.0,
    fontWeight: FontWeight.w700);

const tsBoldTextWhite18 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 18.0,
    fontWeight: FontWeight.w700);

const tsBoldTextDarkGrey18 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 18.0,
    fontWeight: FontWeight.w700);

const tsBoldTextWhite20 = TextStyle(
    color: Colors.white,
    fontFamily: 'averta',
    fontSize: 20.0,
    fontWeight: FontWeight.w700);
const tsBoldTextBlack20 = TextStyle(
    color: Colors.black,
    fontFamily: 'averta',
    fontSize: 20.0,
    fontWeight: FontWeight.w700);

const tsBoldTextWhite4014 = TextStyle(
    color: AppColors.white40,
    fontFamily: 'averta',
    fontSize: 12.0,
    fontWeight: FontWeight.w500);
const tsBoldTextGrey12 = TextStyle(
    color: AppColors.training_color_6,
    fontFamily: 'averta',
    fontSize: 12.0,
    fontWeight: FontWeight.w500);
const tsBoldTextGreen12 = TextStyle(
    color: AppColors.greenColor,
    fontFamily: 'averta',
    fontSize: 12.0,
    fontWeight: FontWeight.w500);
const tsBoldTextGreen20 = TextStyle(
    color: AppColors.greenColor,
    fontFamily: 'averta',
    fontSize: 20.0,
    fontWeight: FontWeight.w600);
const tsBoldTextGray12 = TextStyle(
    color: AppColors.training_color_9,
    fontFamily: 'averta',
    fontSize: 12.0,
    fontWeight: FontWeight.w500);
