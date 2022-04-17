import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ilunch/src/localization/app_translation.dart';
import 'package:ilunch/src/utils/app_colors.dart';
import 'package:ilunch/src/utils/styles.dart';

import 'order_history.dart';

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Text(AppTranslations.of(context).text('my_orders'),
              style: tsMediumTextDarkBlack50Primary14)),
      body: bodyWidget(),
    );
  }

  bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          newOrderWidget(),
          oldOrderWidget(),
           SizedBox(height: 25),        
          Text(
              AppTranslations.of(context).text('you_are_viewing') +
                  ' 30 ' +
                  AppTranslations.of(context).text('for') +
                  ' 186',
              style: tsBoldTextGrey12),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(25),
                border:
                    Border.all(width: 0, color: AppColors.training_color_10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(AppTranslations.of(context).text('load_more'),style: tsBoldTextBlack16,),
            ),
          )
        ],
      ),
    );
  }

  newOrderWidget() {
    return Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(AppTranslations.of(context).text('orders_in_progress') + '(1)',
              style: tsBoldTextBlack16),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderHistory()),
              );
            },
            child: Padding(
                padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.only(top: 5.0, left: 15),
                          height: 55,
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
                                    bottom: 5.0, left: 5, top: 5),
                                child: Text('Salade concombre et fêta',
                                    style: tsMediumTextDarkBlack50Primary14)),
                            Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5.0, left: 5),
                                child: Text('En attente de paiement',
                                    style: tsMediumTextRed12)),
                            Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10.0, left: 5),
                                child: Text('4 articles • 9.6 €',
                                    style: tsBoldTextGrey12))
                          ])),
                      Icon(Icons.chevron_right, color: AppColors.training_color_6)
                    ]))),
          )
        ]));
  }

  oldOrderWidget() {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 20),
                child: Text(
                    AppTranslations.of(context).text('old_orders') + '(5)',
                    style: tsBoldTextBlack16)),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return oldOrderItem();
                }),
          ],
        ));
  }

  oldOrderItem() {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderHistory()),
        );
      },
      child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                        margin: const EdgeInsets.only(top: 10.0, left: 15),
                        height: 55,
                        width: 65,
                        child: CachedNetworkImage(
                            imageUrl:
                                'https://image.shutterstock.com/image-photo/woman-hands-hold-glass-wine-600w-748591678.jpg',
                            fit: BoxFit.fill)),
                    SizedBox(width: 10),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                          Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 5.0, left: 5),
                              child: Text('Salade concombre et fêta',
                                  style: tsMediumTextDarkBlack50Primary14)),
                          Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text('4 articles • 9.6 €',
                                  style: tsBoldTextGrey12))
                        ])),
                    Icon(Icons.chevron_right, color: AppColors.training_color_6)
                  ]),
                  Divider(thickness: 0.5),
                ],
              ))),
    );
  }
}
