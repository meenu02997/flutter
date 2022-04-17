import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilunch/src/pages/home/order/order_details.dart';
import 'package:ilunch/src/utils/app_colors.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/utils/styles.dart';

class OrderBottom extends StatefulWidget {
  @override
  _OrderBottomState createState() => _OrderBottomState();
}

class _OrderBottomState extends State<OrderBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(loginBackground),
      body: appbarWidget(),
    );
  }

  appbarWidget() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.green,
          expandedHeight: 70 ,
          automaticallyImplyLeading: false,
          floating: true,
          pinned: true,
          //floating: false,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SvgPicture.asset('assets/images/logo_fr.svg',
                //  width: 86,
                height: 45,
                color: Colors.white,
                fit: BoxFit.contain),
            Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                    margin: const EdgeInsets.only(right: 40),
                    child: SvgPicture.asset('assets/images/logo_fr.svg',
                        //  width: 86,
                        height: 40,
                        color: Colors.white,
                        fit: BoxFit.contain))),
            Container()
          ]),


        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          dateWidget(),
                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Composez votre déjeuner !',
                                style: tsBoldButtonBlack20,
                              )),
                          foodTypeWidget(),
                          Divider(),
                          foodListWidget(),
                        ]),
                childCount: 1))
      ],
    );
  }

  dateWidget() {
    return Container(
        height: 50,
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
            child: Row(children: [
              Expanded(
                  child: Row(children: [
                Image.asset('assets/images/ic_shopping_bag.png', height: 25),
                SizedBox(width: 5),
                Text('Repas mercredi 20 janvier • Midi',
                    style: tsMediumTextBlack50Primary14)
              ])),
              Text('Modifier', style: tsMediumTextGreenUnderLine14)
            ])));
  }

  foodTypeWidget() {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 5, top: 3, bottom: 3),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.only(left: 7.5, right: 7.5, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: AppColors.dark_grey_blue,
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 5, bottom: 7.5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        'assets/images/ic_dinner_dish.png',
                        height: 25,
                      ),
                    ),
                    Container(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(left: 5, right: 10, top: 8),
                      child: Text(
                        'Entrée',
                        style: tsMediumTextWhite12,
                      ),
                    )),
                  ],
                ),
              ));
        },
      ),
    );
  }

  foodListWidget() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderDetails()),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2.3,
              margin: EdgeInsets.all(7.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height / 4.5,
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
                                  width: 1, color: AppColors.blackOpacity15)),
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
    );
  }
}
