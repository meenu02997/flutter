import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/color_converter_utils.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider(
        this.color,
        // ignore: prefer_asserts_with_message
        this.height,) : assert(color != null);
  final String color;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: HexColor(color),width: height),
        ),
      ),
    );
  }
}
