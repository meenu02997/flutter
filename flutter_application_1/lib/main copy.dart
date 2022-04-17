import 'package:flutter/material.dart';
import 'package:meenu_mega_test/NewsListScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shared prefrence',
      home: NewsListScreen(),
    );
  }
}
