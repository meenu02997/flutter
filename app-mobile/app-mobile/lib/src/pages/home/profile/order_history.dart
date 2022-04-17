import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ilunch/src/localization/app_translation.dart';
import 'package:ilunch/src/utils/app_colors.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/utils/styles.dart';
import 'package:ilunch/src/widgets/base_widget.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: HexColor(loginBackground),
        elevation: 0,
        toolbarHeight: 40,
        brightness: Brightness.light,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0,top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Ma facture',
                      style: tsBoldTextGreen12,
                    ),
                    Icon(Icons.file_download,color: AppColors.greenColor,)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: BaseWidget(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bodyWidget(),
                Divider(thickness: 0.5),
                foodItemList(),
                SizedBox(height: 15),
                Text(AppTranslations.of(context).text('order_detail'),
                    style: tsBoldTextBlack14),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.training_color_5, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16, top: 5, bottom: 5),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '2x',
                                      style: tsMediumTextGreen14,
                                    ),
                                    Text(
                                      ' Entrée non subventionnée',
                                      style: tsMediumTextDarkBlack50Primary14,
                                    ),
                                  ],
                                ),
                                Text(
                                  ' 3€',
                                  style: tsMediumTextDarkBlack50Primary14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '1x',
                                      style: tsMediumTextGreen14,
                                    ),
                                    Text(
                                      '  i-Lunch Box consignée',
                                      style: tsMediumTextDarkBlack50Primary14,
                                    ),
                                  ],
                                ),
                                Text(
                                  ' 5€',
                                  style: tsMediumTextDarkBlack50Primary14,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '2x',
                                          style: tsMediumTextGreen14,
                                        ),
                                        Text(
                                          ' Couverts jetables',
                                          style:
                                              tsMediumTextDarkBlack50Primary14,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      ' 3€',
                                      style: tsMediumTextDarkBlack50Primary14,
                                    )
                                  ])),
                          Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Crédit i-Lunch',
                                        style: tsMediumTextGreenUnderLine14),
                                    Text(' -654€',
                                        style: tsMediumTextGreenUnderLine14)
                                  ])),
                          Divider(),
                          Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total TTC',
                                        style: tsMediumTextBlack50Primary14),
                                    Text(' -654€',
                                        style: tsMediumTextBlack50Primary14)
                                  ])),
                          Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text('dont TVA',
                                            style: tsMediumTextGrey12),
                                        InkWell(
                                          onTap: () {
                                            //  taxClick();
                                          },
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Container(
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors
                                                          .training_color_5,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Center(
                                                  child: Text(
                                                'i',
                                                style: tsMediumTextBlack10,
                                              )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Text('65€', style: tsMediumTextGrey12)
                                  ])),
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('dont consigne',
                                        style: tsMediumTextGrey12),
                                    Text('64€', style: tsMediumTextGrey12)
                                  ])),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(AppTranslations.of(context).text('billing_address'),
                    style: tsBoldTextBlack14),
                personalInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bodyWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 5.0, left: 5, top: 5),
                child: Text('Votre commande #129049',
                    style: tsMediumTextDarkBlack50Primary14)),
            Padding(
                padding: const EdgeInsets.only(
                  bottom: 5.0,
                  left: 5,
                ),
                child: Text('5 janvier 2021', style: tsBoldTextBlack18)),
            Padding(
                padding: const EdgeInsets.only(bottom: 5.0, left: 5),
                child: Text('Livré', style: tsMediumTextDarkBlack50Primary14)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 5),
                child:
                    Text('Total TTC', style: tsMediumTextDarkBlack50Primary14)),
            Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                ),
                child: Text('9,6 €', style: tsBoldTextGreen20)),
          ],
        ),
      ],
    );
  }

  foodItemList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return foodItem();
        });
  }

  foodItem() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderHistory()),
          );
        },
        child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
                decoration: BoxDecoration(
                  color: AppColors.training_color_7,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(children: [
                  Container(
                      margin: const EdgeInsets.only(top: 5.0, left: 15),
                      height: 65,
                      width: 65,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://image.shutterstock.com/image-photo/woman-hands-hold-glass-wine-600w-748591678.jpg',
                        fit: BoxFit.fill,
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                        Padding(
                            padding: const EdgeInsets.only(
                              bottom: 5.0,
                              left: 5,
                              top: 15,
                            ),
                            child: Text('Entrée(s)', style: tsBoldTextBlack14)),
                        Padding(
                            padding:
                                const EdgeInsets.only(bottom: 5.0, left: 5),
                            child: Text('Salade concombre et fêta',
                                style: tsMediumTextDarkBlack50Primary14)),
                        Padding(
                            padding:
                                const EdgeInsets.only(bottom: 15.0, left: 5),
                            child: Text('x1', style: tsMediumTextGreen14))
                      ])),
                ]))),
      )
    ]);
  }

  Widget personalInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.training_color_5, width: 1),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sylvain Hourany',
                        style: tsSemiMediumTextBlack50Primary16),
                    SizedBox(height: 2),
                    Text('13 avenue Joseph Étienne',
                        style: tsMediumTextBlack50Primary14),
                    SizedBox(height: 2),
                    Text('13007 Marseille',
                        style: tsMediumTextBlack50Primary14),
                    SizedBox(height: 2),
                    Text('France', style: tsMediumTextBlack50Primary14),
                    SizedBox(height: 10),
                  ]))),
    );
  }
}
