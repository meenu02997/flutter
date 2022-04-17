import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  // function for converting hex string color to hex decimal
  static int _getColorFromHex(String hexColor) {
    String colorInHex = hexColor;
    colorInHex = hexColor.toUpperCase().replaceAll('#', '');
    if (colorInHex.length == 6) {
      colorInHex = 'FF$colorInHex';
    }
    return int.parse(colorInHex, radix: 16);
  }
}
