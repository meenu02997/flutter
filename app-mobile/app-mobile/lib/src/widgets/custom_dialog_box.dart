import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../localization/app_translation.dart';
import '../utils/color_converter_utils.dart';
import '../utils/color_utils.dart';
import '../utils/font_utils.dart';
import '../utils/size_utils.dart';
import 'rounded_button.dart';

class CustomDialogBox extends StatefulWidget {
  const CustomDialogBox(
      {Key key,
      this.title,
      this.descriptions,
      this.buttonTitle,
      this.onPressed})
      : super(key: key);

  final String title, descriptions, buttonTitle;
  final Function onPressed;

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  // ignore: type_annotate_public_apis
  Stack contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          constraints: const BoxConstraints(minWidth: 350),
          width: SizeUtils.blockSizeHorizontal * 0.27,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        HexColor(appGreen),
                        HexColor(appGreen),
                      ]),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5))),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: largeTextSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 20, bottom: 10),
                child: Text(
                  widget.descriptions,
                  style: TextStyle(
                      fontSize: mediumTextSize,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: RoundedButton(
                            height: 30,
                            text: AppTranslations.of(context).text('cancel'),
                            onPressed: () => widget.onPressed('cancel'),
                            radius: 20,
                            color: Colors.black,
                            contrastColor: Colors.white,
                          ))),
                  Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: RoundedButton(
                            height: 30,
                            text: widget.buttonTitle,
                            onPressed: () => widget.onPressed('delete'),
                            radius: 20,
                            color: Colors.white,
                            contrastColor:  HexColor(appGreen),
                          ))),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
