import 'package:flutter/material.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({
    Key key,
    this.child,
    this.backIcon = false,
  }) : super(key: key);
  final Widget child;
  final bool backIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor(loginBackground),
      child: Column(
        children: [
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: child,
              ))
        ],
      ),
    );
  }
}
