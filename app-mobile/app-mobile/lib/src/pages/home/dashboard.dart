import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilunch/src/localization/app_translation.dart';
import 'package:ilunch/src/pages/home/profile/profile_bottom.dart';
import 'package:ilunch/src/pages/home/scanner/scan_qr.dart';
import 'package:ilunch/src/widgets/coming_soon_page.dart';
import '../../widgets/bmnav.dart' as bmnav;
import 'cart/shopping_cart.dart';
import 'order/order.dart';

class DashBoardPage extends StatefulWidget {
  @override
  DashBoardPageState createState() => DashBoardPageState();
}

class DashBoardPageState extends State<DashBoardPage> {
  int currentTab = 2;
  final List<Widget> screens = [
    OrderBottom(),
    ShoppingCart(),
    ScanQRpage(),
    ComingSoonPage(),
    ProfileBottom(),
  ];
  Widget currentScreen = ScanQRpage();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor:
          Platform.isAndroid && currentTab == 2 ? Colors.black : Colors.white,
      body: PageStorage(child: currentScreen, bucket: bucket),
      bottomNavigationBar: bmnav.BottomNav(
        index: currentTab,
        labelStyle: bmnav.LabelStyle(visible: true),
        onTap: (i) {
          setState(() {
            currentTab = i;
            currentScreen = screens[i];
          });
        },
        items: [
          bmnav.BottomNavItem('assets/images/home.png',
              label: AppTranslations.of(context).text('tab_order')),
          bmnav.BottomNavItem('assets/images/cart.png',
              label: AppTranslations.of(context).text('tab_cart')),
          bmnav.BottomNavItem('assets/images/qr.png',
              label: AppTranslations.of(context).text('tab_disconnect')),
          bmnav.BottomNavItem('assets/images/pie.png',
              label: AppTranslations.of(context).text('tab_nutrition')),
          bmnav.BottomNavItem('assets/images/user.png',
              label: AppTranslations.of(context).text('tab_account'))
        ],
      ),
    );
  }
}
