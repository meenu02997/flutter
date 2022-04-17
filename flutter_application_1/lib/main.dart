import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'shared prefrence',
        home: HomePage(),
      );    
    });
  }
}

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
          child:Text('Hello World', style: TextStyle(fontSize: 30.sp),)
        ),
      ),
    )
  }
}