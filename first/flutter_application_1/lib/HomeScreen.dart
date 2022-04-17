import 'package:flutter/material.dart';

class Homee extends StatelessWidget {
  const Homee({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My flutter app",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 0,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ) ,

          title: Text("Second Time visited",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        body:Container(
          color: Colors.limeAccent,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Center(
                  child: Text("This is the Homepage ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                ),
                ElevatedButton(
                    onPressed: () async{
                      // final SharedPreferences preferences = await SharedPreferences.getInstance();
                      // preferences.remove('alreadyVisited');
                    },
                    child: Text("remove data")
                )
              ],
            ),
          ),
        )
    );
  }
}