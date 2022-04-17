import 'package:flutter/material.dart';

import '../utils/color_converter_utils.dart';
import '../utils/color_utils.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({this.isSelected, this.fillColor});
  final bool isSelected;
  final String fillColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 0,
            color: isSelected ? Colors.transparent : HexColor(appGreen)),
        shape: BoxShape.circle,
        color: isSelected ? HexColor(fillColor) : HexColor(appGreen),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: isSelected
            ? Icon(
                Icons.check,
                size: 8,
                color:Colors.white,
              )
            : Icon(
                Icons.check_box_outline_blank,
                size: 8,
                color: isSelected ? HexColor(fillColor) : HexColor(appGreen),
              ),
      ),
    );
  }
}
