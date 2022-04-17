import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SuperBasic(),
    );
  }
}

class SuperBasic extends StatefulWidget {
  const SuperBasic({Key key}) : super(key: key);

  @override
  _SuperBasicState createState() => _SuperBasicState();
}

class _SuperBasicState extends State<SuperBasic> with SingleTickerProviderStateMixin{

  //Explicit Animation.
  AnimationController _animationController;
  double currentvalue;
  Animation curveAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    _animationController = AnimationController(
      duration: Duration(seconds: 4),
        vsync: this
    );

    curveAnimation = CurvedAnimation(parent: _animationController, curve: Curves.elasticOut);

    _animationController.addListener(() {
      setState((){
        currentvalue = _animationController.value;
      });
    });
    _animationController.repeat();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$currentvalue",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

            SizedBox(height: 60,),

            RotationTransition(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.purple,
              ),
              alignment: Alignment.center,
              turns: Tween<double>(begin: 0, end: 1).animate(curveAnimation),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          if(_animationController.isAnimating){
            _animationController.stop();
          }else{
            _animationController.repeat();
          }
        },
      ),
    );
  }
}
