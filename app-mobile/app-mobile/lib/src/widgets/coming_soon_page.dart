import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilunch/src/localization/app_translation.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/widgets/base_widget.dart';

class ComingSoonPage extends StatefulWidget {
  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(loginBackground),
        elevation: 0,
        toolbarHeight: 40,
        brightness: Brightness.light,
      ),
      backgroundColor: Colors.white,
      body: BaseWidget(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 120),
          child: Column(
            children: [
              Image(
                  image: AssetImage('assets/images/coming_soon.png'),
                  width: 160,
                  height: 160,
                  fit: BoxFit.fitWidth),
              Text(
                AppTranslations.of(context).text('coming_soon'),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: HexColor('#1a2c2e'),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'young'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                AppTranslations.of(context).text('coming_soon_subtitle'),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: HexColor('#7e7e7e'),
                    fontSize: 14,
                    fontFamily: 'averta_regular'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
