import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilunch/src/utils/styles.dart';

import 'app_colors.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {@required this.buttonText, @required this.onButtonPressed});

  final String buttonText;
  final Function onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onButtonPressed();
        },
        child: Container(
            width: MediaQuery.of(context).size.width/1.7 ,
            height: 50,
            margin: EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.greenColor,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Center(
                child: Text(buttonText,
                    textAlign: TextAlign.center, style: tsBoldTextWhite13))));
  }
}

class PrimaryPriceButton extends StatelessWidget {
  const PrimaryPriceButton(
      {@required this.buttonText, @required this.onButtonPressed});

  final String buttonText;
  final Function onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onButtonPressed();
        },
        child: Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.greenColor,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('',
                    textAlign: TextAlign.center, style: tsMediumTextWhite16),
                Padding(
                  padding: const EdgeInsets.only(left: 58.0),
                  child: Text(buttonText,
                      textAlign: TextAlign.center, style: tsBoldTextWhite13),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text('5,1 €',
                      textAlign: TextAlign.right, style: tsBoldTextWhite13,),
                ),
              ],
            )));
  }
}


