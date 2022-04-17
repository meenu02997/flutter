import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilunch/src/localization/app_translation.dart';
import 'package:ilunch/src/utils/app_colors.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/utils/primary_button.dart';
import 'package:ilunch/src/utils/styles.dart';
import 'package:ilunch/src/widgets/base_widget.dart';
import 'package:ilunch/src/widgets/horizontal_divider.dart';
import 'package:ilunch/src/widgets/rounded_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  bool nutritionalCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(loginBackground),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: HexColor(loginBackground),
        elevation: 0,
        toolbarHeight: 40,
        brightness: Brightness.light,
      ),
      body: orderDetailsBodyWidget(),
    );
  }

  orderDetailsBodyWidget() {
    return BaseWidget(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                    //margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                                height: MediaQuery.of(context).size.height / 4,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://image.shutterstock.com/image-photo/woman-hands-hold-glass-wine-600w-748591678.jpg',
                                  fit: BoxFit.fill,
                                ))),
                        Padding(
                          padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Container(
                                  child: Text('Athlétique • Léger en calorie',
                                      style: tsBoldTextWhite4014,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(height: 10),
                                Container(
                                    child: Text('Salade concombre et fêta ',
                                        style: tsBoldTextBlack20,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis)),
                                SizedBox(height: 10),
                                Container(
                                  child: Text(
                                      'Une entrée fraîche et healthy avec son concombre riche en eau qui favorise votre bonne hydratation tout au long de la journée ! En plus, il est très peu calorique. ',
                                      style: tsMediumTextDarkBlack50Primary14,
                                      maxLines: 6,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(height: 15),
                                Container(
                                    child: Text('Healthy végétarien ',
                                        style: tsBoldTextGreen12,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis)),
                                SizedBox(height: 5),
                                Container(
                                  child: Text(
                                      'Se mange froid\ni-Lunch Box consignée x1',
                                      style: tsBoldTextWhite4014,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(height: 10),
                                Divider(thickness: 0.5),
                                SizedBox(height: 10),
                                Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(children: [
                                      Expanded(
                                          child: IntrinsicHeight(
                                              child: Row(children: [
                                        SvgPicture.asset(
                                            'assets/images/nutri_a.svg',
                                            height: 45),
                                        SizedBox(width: 15),
                                        VerticalDivider()
                                      ]))),
                                      Expanded(
                                          child: IntrinsicHeight(
                                              child: Row(children: [
                                        SvgPicture.asset(
                                            'assets/images/eco_a.svg',
                                            height: 45),
                                        SizedBox(width: 15),
                                        VerticalDivider()
                                      ]))),
                                      Expanded(
                                          child: Row(
                                        children: [
                                          SizedBox(width: 25),
                                          Text('324 Kcal',
                                              style: tsBoldTextGray12),
                                        ],
                                      ))
                                    ])),
                                SizedBox(height: 20),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.training_color_5,
                                            width: 0.5),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (nutritionalCheck)
                                                    setState(() {
                                                      nutritionalCheck = false;
                                                    });
                                                  else
                                                    setState(() {
                                                      nutritionalCheck = true;
                                                    });
                                                });
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: nutritionalCheck
                                                          ? AppColors
                                                              .training_color_11
                                                          : AppColors.white,
                                                      borderRadius:
                                                          nutritionalCheck
                                                              ?     BorderRadius.only(
                                                              topLeft: Radius.circular(5),
                                                              topRight: Radius.circular(5))
                                                              : null),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                        
                                                          Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                // if (!nutritionalCheck)

                                                                Container(
                                                                  margin:
                                                                  const EdgeInsets.only(
                                                                      top:10.0),
                                                                  child: Text(
                                                                      'Valeurs nutritionnelles',
                                                                      style:
                                                                          tsMediumTextBlack12),
                                                                ),
                                                                if (nutritionalCheck)
                                                                  Container(
                                                                    margin:
                                                                    const EdgeInsets.only(
                                                                        top:25.0),
                                                                    child:
                                                                    Padding(
                                                                      padding:
                                                                      EdgeInsets.all(
                                                                          15.0),
                                                                      child:
                                                                      CircularPercentIndicator(
                                                                        radius:
                                                                        60.0,
                                                                        lineWidth:
                                                                        8.0,
                                                                        percent:
                                                                        0.2,
                                                                        center:
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              "3g",
                                                                              style: tsMediumTextBlack12,
                                                                            ),
                                                                            Text(
                                                                              "20%",
                                                                              style: tsMediumTextBlack10,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        progressColor:
                                                                        AppColors.training_color_12,
                                                                      ),
                                                                    ),
                                                                  ),

                                                                SizedBox(
                                                                    height:
                                                                    5),
                                                                Spacer(),
                                                                Icon(
                                                                  nutritionalCheck
                                                                      ? Icons
                                                                          .keyboard_arrow_up
                                                                      : Icons
                                                                          .keyboard_arrow_down,
                                                                  color: AppColors
                                                                      .training_color_6,
                                                                )
                                                              ]),
                                                          if (nutritionalCheck)
                                                            Row(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                          'Glucides',
                                                                          style:
                                                                          tsMediumTextBlack10),
                                                                      Padding(
                                                                        padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                        child:
                                                                        CircularPercentIndicator(
                                                                          radius:
                                                                          60.0,
                                                                          lineWidth:
                                                                          3.0,
                                                                          percent:
                                                                          0.2,
                                                                          center:
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "3g",
                                                                                style:
                                                                                tsMediumTextBlack12,
                                                                              ),
                                                                              Text(
                                                                                "20%",
                                                                                style:
                                                                                tsMediumTextBlack10,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          progressColor:
                                                                          AppColors
                                                                              .training_color_12,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),

                                                                Expanded(
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                          'Lipides',
                                                                          style:
                                                                          tsMediumTextBlack10),
                                                                      Padding(
                                                                        padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                        child:
                                                                        CircularPercentIndicator(
                                                                          radius:
                                                                          60.0,
                                                                          lineWidth:
                                                                          3.0,
                                                                          percent:
                                                                          0.4,
                                                                          center:
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "13g",
                                                                                style:
                                                                                tsMediumTextBlack12,
                                                                              ),
                                                                              Text(
                                                                                "40%",
                                                                                style:
                                                                                tsMediumTextBlack10,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          progressColor:
                                                                          AppColors
                                                                              .training_color_12,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),

                                                                Expanded(
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                          'Protéines',
                                                                          style:
                                                                          tsMediumTextBlack10),
                                                                      Padding(
                                                                        padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                        child:
                                                                        CircularPercentIndicator(
                                                                          radius:
                                                                          60.0,
                                                                          lineWidth:
                                                                          3.0,
                                                                          percent:
                                                                          0.6,
                                                                          center:
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "31g",
                                                                                style:
                                                                                tsMediumTextBlack12,
                                                                              ),
                                                                              Text(
                                                                                "60%",
                                                                                style:
                                                                                tsMediumTextBlack10,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          progressColor:
                                                                          AppColors
                                                                              .training_color_12,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                          'Fibres',
                                                                          style:
                                                                          tsMediumTextBlack10),
                                                                      Padding(
                                                                        padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                        child:
                                                                        CircularPercentIndicator(
                                                                          radius:
                                                                          60.0,
                                                                          lineWidth:
                                                                          3.0,
                                                                          percent:
                                                                          0.06,
                                                                          center:
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "11g",
                                                                                style:
                                                                                tsMediumTextBlack12,
                                                                              ),
                                                                              Text(
                                                                                "6%",
                                                                                style:
                                                                                tsMediumTextBlack10,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          progressColor:
                                                                          AppColors
                                                                              .training_color_12,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                        ],
                                                      )))),
                                          if (!nutritionalCheck)
                                            Divider(
                                                color:
                                                    AppColors.training_color_5),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(children: [
                                                Text(
                                                    'Ingrédients et allergènes',
                                                    style: tsMediumTextBlack12),
                                                Spacer(),
                                                Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: AppColors
                                                      .training_color_6,
                                                )
                                              ])),
                                          Divider(
                                            color: AppColors.training_color_5,
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(children: [
                                                Text('Conseils de préparation',
                                                    style: tsMediumTextBlack12),
                                                Spacer(),
                                                Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: AppColors
                                                      .training_color_6,
                                                )
                                              ])),
                                          SizedBox(height: 3)
                                        ])),
                                SizedBox(height: 40),
                                Text('Dans cette recette…  ',
                                    style: tsBoldTextBlack14),
                                SizedBox(height: 10),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.greenColor,
                                            width: 0.5),
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/ic_path_bg.png"),
                                            fit: BoxFit.cover)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/ic_illustration.svg'),
                                                SizedBox(width: 10),
                                                Text(
                                                    '100% d’ingrédients français',
                                                    style: tsMediumTextBlack12)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/ic_dinner_dish.svg'),
                                                SizedBox(width: 10),
                                                Text(
                                                    '70% d’ingrédients labellisés',
                                                    style: tsMediumTextBlack12)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/ic_leaf.svg'),
                                                SizedBox(width: 10),
                                                Text('78% d’ingrédients bio',
                                                    style: tsMediumTextBlack12)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(children: [
                                                SvgPicture.asset(
                                                    'assets/images/ic_sun.svg'),
                                                SizedBox(width: 10),
                                                Text(
                                                    '100% de fruits & légumes de saison',
                                                    style: tsMediumTextBlack12)
                                              ]))
                                        ]))),
                                SizedBox(height: 25),
                                similiarFoodWidget()
                              ]),
                        ),
                      ],
                    )),
              )
            ]),
          ),
          Container(
              height: 80,
              color: AppColors.white,
              child: Row(
                children: [
                  Container(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/ic_minus.svg',
                            color: AppColors.greenColor),
                        SizedBox(width: 20),
                        Text(
                          "1",
                          style: tsBoldTextBlack14,
                        ),
                        SizedBox(width: 20),
                        SvgPicture.asset('assets/images/ic_plus.svg',
                            color: AppColors.greenColor)
                      ],
                    ),
                  ),
                  PrimaryButton(
                      buttonText: AppTranslations.of(context).text('addToCart'),
                      onButtonPressed: null),
                ],
              ))
        ],
      ),
    );
  }

  Widget _addToCartButton() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      margin: EdgeInsets.only(
        left: 16,
      ),
      child: RoundedButton(
        height: 45,
        text: AppTranslations.of(context).text('addToCart'),
        radius: 30,
        kind: RoundedButtonKind.filled,
        contrastColor: Colors.white,
        color: HexColor(appGreen),
        onPressed: () => {},
      ),
    );
  }

  similiarFoodWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 85),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vous aimerez aussi…', style: tsMediumTextBlack50Primary14),
          SizedBox(height: 5),
          Container(
            height: MediaQuery.of(context).size.height / 2.85,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderDetails()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.6,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.training_color_7,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 5.5,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://image.shutterstock.com/image-photo/woman-hands-hold-glass-wine-600w-748591678.jpg',
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Row(children: [
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 7.5, bottom: 7.5),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: new BorderRadius.only(
                                      bottomRight: const Radius.circular(150.0),
                                      topLeft: const Radius.circular(20),
                                      topRight: const Radius.circular(150.0)),
                                ),
                                child: Center(
                                  child: Text('Nouveau',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                )),
                          ])
                        ]),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: Text('Athlétique • Léger en calorie',
                              style: tsBoldTextWhite4014,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ),
                        SizedBox(height: 10),
                        Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            child: Text('Salade concombre et fêta ',
                                style: tsBoldTextBlack16,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis)),
                        SizedBox(height: 5),
                        Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            child: Text('540 Kcal ',
                                style: tsMediumTextBlack12,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                alignment: Alignment.bottomCenter,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: AppColors.blackOpacity15)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Image.asset(
                                    'assets/images/cart.png',
                                    height: 20,
                                  )),
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
