import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage(
      {Key key,
      this.controller,
      this.title,
      this.image,
      this.buttonTitle,
      this.margin})
      : super(key: key);

  final String title, image, buttonTitle;
  final PageController controller;
  final double margin;

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xff1a2c2e),
      padding: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 30),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'young'),
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      left: widget.margin, right: widget.margin),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Image(
                    image: AssetImage(widget.image),
                    fit: BoxFit.fill,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
