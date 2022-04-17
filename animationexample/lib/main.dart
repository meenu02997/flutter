import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
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

class _SuperBasicState extends State<SuperBasic> {

  double width = 300;
  double height = 200;
  double targetvalue = 40.0;
  Color colour = Colors.white;

  CrossFadeState state = CrossFadeState.showFirst;
  double _newValue = .4;
  Color _newColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Implicit animation"),
      ),
      body: Center(
            child:TweenAnimationBuilder(
              tween: ColorTween(begin: Colors.white, end: Colors.red),
              duration: Duration(seconds: 2),
              builder: (_, Color color, __) {
                return ColorFiltered(
                  child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqNKtOqjeWWN7Y8JoMad-Gsczf3FjmQzx9kg&usqp=CAU"),
                  colorFilter: ColorFilter.mode(color, BlendMode.modulate),
                );
              },
            )
        // AnimatedContainer(
        //   width: width,
        //   height: height,
        //   color: colour,
        //   duration: Duration(seconds: 1),
        //   curve: Curves.easeInToLinear,
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            // height = height == 200 ? 300 : 200;
            // width = width == 300? 200:300;

            //colour = colour == Colors.red? Colors.purple:Colors.red;

            state = state == CrossFadeState.showFirst?CrossFadeState.showSecond:CrossFadeState.showFirst;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      /*child: Stack(
        // children: <Widget>[
        //   starsBackground,
        //   Center(
        //     child: TweenAnimationBuilder<double>(
        //       tween: Tween<double>(begin: 0, end: 2 * math.pi),
        //       duration: Duration(seconds: 2),
        //       builder: (BuildContext context, double angle, Widget child) {
        //         return Transform.rotate(
        //           angle: angle,
        //           child: Image.network("https://ak.picdn.net/shutterstock/videos/18632924/thumb/10.jpg"),
        //         );
        //       },
        //     ),
        //   ),
        // ],
      ),*/
    );
  }
}
