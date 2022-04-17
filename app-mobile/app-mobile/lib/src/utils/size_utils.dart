import 'package:flutter/cupertino.dart';

// ignore: constant_identifier_names
const double SchedularContainerMinWidth = 600;
// ignore: constant_identifier_names
const double SchedularContainerMinHeight = 400;

// ignore: constant_identifier_names
const double SchedularTimeLineMinWidth = SchedularContainerMinWidth * 0.71;

class SizeUtils {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double schedularLeftMargin;
  static double schedularRightMargin;
  static double schedularWidth;
  static double hugeTextSize = 24;
  static double largeTextSize = 18;
  static double mediumTextSize = 14;
  static double semiMediumTextSize = 15;
  static double smallTextSize = 12;
  static double semiTinyTextSize = 11;
  static double tinyTextSize = 10;
  static double recommTabWidthPercent = 0.37;
  void init(BuildContext context) {
    //define dynamic width and height as per pixel resolution
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    if (screenWidth > 1280) {
      schedularWidth = screenWidth * 0.756;
      schedularLeftMargin = screenWidth * 0.12;
      schedularRightMargin = screenWidth * 0.12;
      hugeTextSize = 24;
      largeTextSize = 18;
      mediumTextSize = 14;
      smallTextSize = 12;
      semiTinyTextSize = 11;
      tinyTextSize = 10;
      recommTabWidthPercent = 0.4;
    } else if (screenWidth <= 1280 && screenWidth > 1024) {
      schedularWidth = screenWidth * 0.93;
      schedularLeftMargin = screenWidth * 0.04;
      schedularRightMargin = screenWidth * 0.03;
      hugeTextSize = 20;
      largeTextSize = 16;
      mediumTextSize = 12;
      smallTextSize = 10;
      semiTinyTextSize = 9;
      tinyTextSize = 8;
      recommTabWidthPercent = 0.425;
    } else {
      schedularWidth = screenWidth * 0.94;
      schedularLeftMargin = screenWidth * 0.03;
      schedularRightMargin = screenWidth * 0.02;
      hugeTextSize = 20;
      largeTextSize = 14;
      mediumTextSize = 12;
      smallTextSize = 10;
      semiTinyTextSize = 9;
      tinyTextSize = 8;
      recommTabWidthPercent = 0.425;
    }
  }
}
