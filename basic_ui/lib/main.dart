import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      color: Colors.indigo[900],
    )
  );
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(

        child:ListView(
        children:<Widget>[
          Column(

          children: <Widget>[
          //UiImageAsset(),
          Image(
            image: NetworkImage('https://images.wallpapersden.com/image/wxl-small-memory_58461.jpg'),
            fit: BoxFit.fill,
          ),


          Container(
            decoration: BoxDecoration(
              color: Colors.cyan[100],
               // backgroundBlendMode: BlendMode.lighten,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),

                )
            ),

            child: Padding(padding: const EdgeInsets.all(25.0),
              //margin: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign in',
                    //textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  SizedBox(height: 30,),

                  TextFormField(
                    decoration: InputDecoration
                      (
                        hintText: "Username",
                        //border: InputBorder.none,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                      prefixIcon: Icon(Icons.perm_identity),
                        fillColor: Colors.grey[200],
                        filled: true
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: [AutofillHints.email],
                      obscureText: false,

                  ),

                  SizedBox(
                    height: 30,
                  ),


                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: InputBorder.none,

                      prefixIcon: IconButton(
                          icon: Icon(Icons.lock),
                        onPressed: (){

                        },
                      )
                    ),
                    //keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                  ),

                  SizedBox(
                    height: 30,
                  ),


                  Container(
                   // padding: const EdgeInsets.only(bottom: 8.0),
                    //margin: const EdgeInsets.only(left: 2.0,top: 2.0,right: 2.0,bottom:2.0 ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          child: Text(
                              'Sign in',
                           // textAlign: TextAlign.justify,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            textStyle: TextStyle(
                              fontSize: 20.0,
                              //fontWeight: FontWeight.bold,
                              height: 3.0,
                              //wordSpacing: 5.0

                              //padding: const EdgeInsets.all(25),
                            ),
                          ),
                          onPressed: () {
                            print('Pressed');
                          },
                        ),
                      ],
                    )
                  ),


                  SizedBox(
                    height: 60,
                  ),

                Row(
                  children: [
                    Expanded(child: Text(
                      'Forgot your password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),


                  SizedBox(
                    height: 50,
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Don't have an account?",
                            //textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Sign up",
                            //textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 80.0,),
              ]
            ),
          ),
         )
        ],
      ),
    ])));
  }

}

/*class UiImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/UI.jpg');
    Image image = Image(image: assetImage);
    return Container(child: image,);
  }

}*/
