// add all the hex color strings
import 'dart:ui';

import 'package:flutter/cupertino.dart';

const appGreen = '#59ac51';
const loginBackground = '#f6f4ef';
const textColor = '#1a2c2e';
const hintColor = '#7e7e7e';
const errorRed = '#e71d32';
const black = '#000000';

///Darkens a given color by the specified amount
Color darken({
  @required Color color,
  @required double amountToDarken,
}) {
  assert(
    amountToDarken > 0 && amountToDarken <= 1,
    'amountToDarken value is not valid',
  );

  final hslColor = HSLColor.fromColor(color);
  final hslColorDarkened = hslColor.withLightness(
    (hslColor.lightness - amountToDarken).clamp(0, 1).toDouble(),
  );

  return hslColorDarkened.toColor();
}

///Lightens a given color by the specified amount
Color lighten({
  @required Color color,
  @required double amountToLighten,
}) {
  assert(
    amountToLighten > 0 && amountToLighten <= 1,
    'amountToLighten value is not valid',
  );

  final hslColor = HSLColor.fromColor(color);
  final hslColorLightened = hslColor.withLightness(
    (hslColor.lightness + amountToLighten).clamp(0.0, 1.0).toDouble(),
  );

  return hslColorLightened.toColor();
}
