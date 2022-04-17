import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilunch/src/localization/app_translation.dart';
import 'package:ilunch/src/pages/common/tax_botton_sheet.dart';
import 'package:ilunch/src/utils/app_colors.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/utils/primary_button.dart';
import 'package:ilunch/src/utils/styles.dart';
import 'package:ilunch/src/widgets/rounded_button.dart';
import 'package:ilunch/src/pages/common/custom_bottom_sheet.dart'
as CustomBottomSheet;
class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(loginBackground),
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            AppTranslations.of(context).text('my_shopping_cart'),
            style: tsBoldTextBlack16,
          )),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              shrinkWrap: true,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dateWidget(),
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                      AppTranslations.of(context).text('before_your_choice'),
                      style: tsMediumTextBlack50Primary14),
                ),
                SizedBox(height: 5),
                Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.training_color_8,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Icon(Icons.check_box_outline_blank,
                                          color: AppColors.greenColor),
                                      SizedBox(width: 10),
                                      Text(
                                          AppTranslations.of(context)
                                              .text('my_shopping_cart'),
                                          style: tsMediumTextBlack50Primary14)
                                    ]),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Text('+ 0,1€',
                                            style: tsBoldTextGray12))
                                  ])),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Icon(Icons.check_box_outline_blank,
                                          color: AppColors.greenColor),
                                      SizedBox(width: 10),
                                      Text(
                                          AppTranslations.of(context)
                                              .text('my_shopping_cart'),
                                          style: tsMediumTextBlack50Primary14)
                                    ]),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: Text('+ 0,12€',
                                            style: tsBoldTextGray12))
                                  ]))
                        ]))),
                SizedBox(height: 5),
                cartItemListWidget(),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(AppTranslations.of(context).text('order_detail'),
                      style: tsMediumTextBlack50Primary14),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16, top: 5, bottom: 5),
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
                                            taxClick();
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
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
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
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 25, bottom: 5),
                  child: Text('Code promo', style: tsMediumTextBlack12),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 5, bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.training_color_5, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              AppTranslations.of(context)
                                  .text('enter_your_promo_code'),
                              style: tsMediumTextGrey12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.greenColor,
                                  border: Border.all(
                                      width: 1,
                                      color: AppColors.blackOpacity15)),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Center(
                                    child: Icon(
                                  Icons.arrow_right_alt,
                                  color: AppColors.white,
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
                color: AppColors.white,
                child: PrimaryPriceButton(
                  buttonText: 'Add to Cart',
                ))
          ],
        ),
      ),
    );
  }

  dateWidget() {
    return Container(
      height: 50,
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
        child: Row(
          children: [
            Expanded(
                child: Row(
              children: [
                Image.asset('assets/images/ic_shopping_bag.png', height: 25),
                SizedBox(width: 5),
                Text('Repas mercredi 20 janvier • Midi',
                    style: tsMediumTextBlack50Primary14)
              ],
            )),
            Text(
              'Modifier',
              style: tsMediumTextGreenUnderLine14,
            )
          ],
        ),
      ),
    );
  }



  cartItemListWidget() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return cartItemListItem();
        },
      ),
    );
  }

  cartItemListItem() {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Entrée(s)', style: tsMediumTextGreen14),
          Padding(
            padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 85,
                        width: 85,
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://image.shutterstock.com/image-photo/woman-hands-hold-glass-wine-600w-748591678.jpg',
                        )),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25.0, left: 5),
                          child: Text(
                            'Salade concombre et fêta',
                            style: tsMediumTextDarkBlack50Primary14,
                          ),
                        ),
                        // Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
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
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Icon(Icons.delete_outline),
                              )
                            ]
                          )
                        )
                      ]
                    )
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
  void taxClick() {
    CustomBottomSheet.showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.colorTransparent,
      builder: (BuildContext context) {
        return TaxBottomSheet();
      },
    );
  }
}
