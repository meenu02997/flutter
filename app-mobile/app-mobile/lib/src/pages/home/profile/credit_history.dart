import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilunch/src/utils/app_colors.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/utils/styles.dart';

class CreditHistory extends StatefulWidget {
  @override
  _CreditHistoryState createState() => _CreditHistoryState();
}

class _CreditHistoryState extends State<CreditHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(loginBackground),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: AppColors.white,
          centerTitle: true,
          title:
              Text('Crédit i-lunch', style: tsMediumTextDarkBlack50Primary14)),
      body: bodyWidget(),
    );
  }

  bodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        creditList(),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Historique  ',
            style: tsMediumTextBlack50Primary16,
          ),
        ),
        coinWidget(),
      ],
    );
  }

  creditList() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ic_credit_bg.png"),
                fit: BoxFit.cover)),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 35, left: 125),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '4,50 €',
                        style: tsMediumTextDarkBold28,
                      ),
                      Text(
                        'Montant disponible',
                        style: tsMediumTextBlack50Primary16,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0, left: 16),
                  child: SvgPicture.asset(
                    'assets/images/ic_illu_credit.svg',
                    height: 100,
                    width: 100,
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  coinWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return creditListItem();
        },
      ),
    );
  }

  creditListItem() {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 20,
        ),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('20/01/21', style: tsMediumTextGrey12),
                        SizedBox(width: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Commande annulée',
                                  style: tsMediumTextBlack50Primary14),
                              Text('133952', style: tsSemiBoldTextDarkGrey14)
                            ])
                      ])),
              Center(
                  child: Text('+ 4,50€', style: tsMediumTextGreenUnderLine14))
            ]),
            Divider(
              color: AppColors.training_color_11,
            )
          ],
        ),
      ),
    );
  }
}
