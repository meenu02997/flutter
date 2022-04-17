import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilunch/src/utils/app_colors.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/utils/styles.dart';

import 'credit_history.dart';
import 'my_order.dart';
import 'my_profile.dart';

class ProfileBottom extends StatefulWidget {
  @override
  _ProfileBottomState createState() => _ProfileBottomState();
}

class _ProfileBottomState extends State<ProfileBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(loginBackground),
      body: profileBodyWidget(),
    );
  }

  profileBodyWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerWidget(),
          SizedBox(height: 45),
          profileItemWidget(),
          SizedBox(height: 15),
          logoutWidget(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: Text('Version 1.23', style: tsBoldTextGray12),
          )
        ],
      ),
    );
  }

  headerWidget() {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PersonalInfoScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 58.0, left: 20, right: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/ic_profile_user.png',
                      height: 55,
                    ),
                    SizedBox(width: 10),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text('Sylvain Hourany', style: tsBoldTextBlack16),
                          SizedBox(height: 3),
                          Text('Mon profil', style: tsMediumTextGreen14)
                        ])
                  ]),
              Center(
                child: Icon(
                  Icons.chevron_right,
                  color: AppColors.training_color_10,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  profileItemWidget() {
    return Container(
      color: AppColors.white,
      child: Column(children: [
        Column(children: [
          SizedBox(height: 7.5),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyOrder()),
              );
            },
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 20,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/ic_profile.svg',
                                    height: 25),
                                SizedBox(width: 15),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Mes commandes',
                                          style: tsMediumTextBlack50Primary14)
                                    ])
                              ])),
                      Center(
                          child: Icon(
                        Icons.chevron_right,
                        color: AppColors.training_color_10,
                        size: 30,
                      ))
                    ])),
          ),
          Divider(color: AppColors.training_color_11)
        ]),
        Column(children: [
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/ic_card.svg',
                                height: 25),
                            SizedBox(width: 15),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Mes moyens de paiement',
                                      style: tsMediumTextBlack50Primary14)
                                ])
                          ]),
                    ),
                    Center(
                        child: Icon(Icons.chevron_right,
                            color: AppColors.training_color_10, size: 30))
                  ])),
          Divider(color: AppColors.training_color_11)
        ]),
        Column(children: [
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/qr.png', height: 25),
                            SizedBox(width: 15),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Mes consignes',
                                      style: tsMediumTextBlack50Primary14)
                                ])
                          ]),
                    ),
                    Center(
                        child: Icon(Icons.chevron_right,
                            color: AppColors.training_color_10, size: 30))
                  ])),
          Divider(
            color: AppColors.training_color_11,
          )
        ]),
        InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreditHistory()),
            );
          },
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/images/ic_credit.svg',
                                  height: 25),
                              SizedBox(width: 15),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Crédit i-lunch',
                                        style: tsMediumTextBlack50Primary14)
                                  ])
                            ]),
                      ),
                      Center(
                          child: Icon(Icons.chevron_right,
                              color: AppColors.training_color_10, size: 30))
                    ])),
            Divider(color: AppColors.training_color_11)
          ]),
        ),
        Column(children: [
          Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/ic_info.svg',
                                height: 25),
                            SizedBox(width: 15),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Assistance / FAQ',
                                      style: tsMediumTextBlack50Primary14)
                                ])
                          ]),
                    ),
                    Center(
                        child: Icon(Icons.chevron_right,
                            color: AppColors.training_color_10, size: 30))
                  ])),
          // Divider(color: AppColors.training_color_11)
        ]),
        SizedBox(height: 7.5),
      ]),
    );
  }

  logoutWidget() {
    return Container(
      color: AppColors.white,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: Text('Se déconnecter', style: tsMediumTextGreen14),
      ),
    );
  }
}
