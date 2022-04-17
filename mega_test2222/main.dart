import 'package:flutter/material.dart';
import 'package:mega_test2222/Screens/LoginPage_Screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shared prefrence',
      home: MainScreen(),
    );
  }
}
