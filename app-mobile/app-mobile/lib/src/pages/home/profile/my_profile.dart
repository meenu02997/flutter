import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilunch/src/localization/app_translation.dart';
import 'package:ilunch/src/utils/app_colors.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/utils/styles.dart';

import 'edit_profile.dart';

class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(loginBackground),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Text(
            AppTranslations.of(context).text('my_profile'),
            style: tsMediumTextDarkBlack50Primary14,
          )),
      body: bodyWidget(),
    );
  }

  bodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        profilerHeader(),
        SizedBox(height: 30),
        Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    },
                    child: Text(AppTranslations.of(context).text('my_personal_info'),
                        style: tsMediumTextBlack50Primary16),
                  ),
                  Text(AppTranslations.of(context).text('modifier'),
                      style: tsMediumTextGreen14)
                ])),
        personalInfo(),
        SizedBox(height: 25),
        Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(AppTranslations.of(context).text('my_company'),
                style: tsMediumTextBlack50Primary16)),
        companyInfo(),
        SizedBox(height: 25),
        Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppTranslations.of(context).text('billing_address'),
                      style: tsMediumTextBlack50Primary16),
                  Text(AppTranslations.of(context).text('modifier'),
                      style: tsMediumTextGreen14)
                ])),
        personalInfo(),
      ],
    );
  }

  profilerHeader() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: double.infinity,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/ic_profile_bg.png"),
                  fit: BoxFit.cover)),
          child: Stack(alignment: Alignment.bottomLeft, children: [
            Stack(alignment: Alignment.bottomLeft,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(alignment: Alignment.bottomRight, children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 28.0, left: 16),
                        child: Image.asset('assets/images/ic_profile_user.png',
                            height: 100, width: 100)),
                    Container(
                        margin: const EdgeInsets.only(bottom: 35.0, right: 5),
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.greenColor),
                        child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Center(
                                child: SvgPicture.asset(
                                    'assets/images/ic_pen.svg',
                                    color: AppColors.white,
                                    height: 13))))
                  ]),
                  Container(
                    margin: EdgeInsets.only(bottom: 35, left: 135),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Sylvain Hourany', style: tsMediumTextDarkBold23),
                        Text('Commercial', style: tsMediumTextBlack50Primary14),
                      ],
                    ),
                  ),
                ])
          ])),
    );
  }

  Widget personalInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
          ),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sylvain Hourany',
                        style: tsSemiMediumTextBlack50Primary16),
                    SizedBox(height: 2),
                    Text('13 avenue Joseph Étienne', style: tsMediumTextBlack50Primary14),
                    SizedBox(height: 2),
                    Text('13007 Marseille',
                        style: tsMediumTextBlack50Primary14),
                    SizedBox(height: 2),
                    Text('France',
                        style: tsMediumTextBlack50Primary14),
                    SizedBox(height: 10),
                  ]))),
    );
  }

  Widget companyInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Schneider Electric',
                            style: tsSemiMediumTextBlack50Primary16),
                        SizedBox(height: 2),
                        Text('Homme, 40 ans',
                            style: tsMediumTextBlack50Primary14),
                        Text('contact@permeable.org',
                            style: tsMediumTextBlack50Primary14),
                        Text('Livraison entre 12h15 et 12h45',
                            style: tsMediumTextBlack50Primary14),
                      ]),
                  Container(

                      decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15.0,25,15,25),
                        child: SvgPicture.asset('assets/images/logo_fr.svg',
                            height: 30,
                            color: Colors.white,
                            fit: BoxFit.contain),
                      )),
                ],
              ))),
    );
  }
}
