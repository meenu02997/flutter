import 'package:flutter/material.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';

enum RoundedButtonKind { filled, outline }

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key key,
      this.text,
      this.onPressed,
      this.radius,
      this.color,
      this.kind = RoundedButtonKind.outline,
      this.contrastColor,
      this.disable = false,
      this.height})
      : super(key: key);
  final String text;
  final double radius;
  final Color color;
  final double height;
  final bool disable;
  final Color contrastColor;
  final RoundedButtonKind kind;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    print(disable);
    return Container(
      height: height ?? 50,
      padding: const EdgeInsets.only(left: 15, right: 15),
      // ignore: deprecated_member_use
      child: FlatButton(
        disabledColor: Color(0xff59ac51).withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(
              style: color != null && kind == RoundedButtonKind.outline
                  ? BorderStyle.solid
                  : BorderStyle.none,
              color: onPressed == null || disable
                  ? Colors.transparent
                  : (color ?? Colors.transparent)),
        ),
        color: kind == RoundedButtonKind.filled ? color : contrastColor,
        onPressed: disable ? null:onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'averta_bold',
              color: onPressed == null || disable
                  ? Colors.white
                  : (kind == RoundedButtonKind.filled ? contrastColor : HexColor('#1a2c2e'))),
        ),
      ),
    );
  }
}
