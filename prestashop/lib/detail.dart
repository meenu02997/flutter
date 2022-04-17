import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prestashop/Shopping_Cart.dart';
import 'package:prestashop/Model.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          return OrientationBuilder(
              builder: (context , orientation){
                //SizeConfig().init(constraints,orientation);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'My app',
                  home: second(),
                );
              }
          );
        }
    );
  }
}

class second extends StatefulWidget {

  //final String title;
  @override
  _secondState createState() => _secondState();
}

class _secondState extends State<second> {
  MainClass m = new MainClass();

  var url = Uri.parse("https://prestashop.webkul.com/ps17/ps-mobikul/api/mobikul/getproductpage?width=720&id_product=56&ws_key=PXIHTSBPK7781D2M6SB4C5IV9SRJ832Z&outputformat=json");
  Future<String> fetch() async{

    var response = await http.get(url);
    var data = jsonDecode(response.body);
    if(response.statusCode==200)
    {
      print(response.statusCode);
      print(response.body);
      setState(()
      {
        m = MainClass.fromJson(data);
       // circular=true;
      }
      );
    }
  }

  @override
  void initState() {
    fetch();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

            appBar: AppBar(
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
              title: Text("${m.product.name}",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),

              actions: <Widget>[
                IconButton(icon: Icon(Icons.shopping_cart, color: Colors.black,),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
                  },
                ),
              ],
              backgroundColor: Colors.white,
              toolbarHeight: 80.0,
            ),


            body:SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        //height: 50*SizeConfig,
                        height: MediaQuery.of(context).size.height*0.38,
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                        ),
                      ),
                      Positioned(
                          height: MediaQuery.of(context).size.height*0.4,
                          child: Image.network('https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
                            fit: BoxFit.cover,
                          )
                      ),
                      SizedBox(height: 10.0,),
                      Positioned(
                        top:  MediaQuery.of(context).size.height*0.37,
                        left: MediaQuery.of(context).size.width*0.85,
                        child: FloatingActionButton(
                          child: Icon(
                              CupertinoIcons.arrow_uturn_right
                          ),
                          backgroundColor: Colors.purple,
                          onPressed: (){},

                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height*0.44,

                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.36,
                          decoration: BoxDecoration(
                            color: Colors.lime,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 7.0,),
                              Text("In Stock",style:  TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),),
                              SizedBox(height: 7.0,),
                              Text(m.product.name,style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
                              SizedBox(height: 7.0,),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(text: m.product.oldPrice, style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black54)),
                                    TextSpan(text: "   " + m.product.price, style: TextStyle(color: Colors.black))])
                              ),
                              SizedBox(height: 7.0,),
                              Text(m.product.description,style:TextStyle(color:Colors.black,fontSize: 10.0, )),
                              //SizedBox(height: 7.0,),
                             // Text("Paneled construction",style:TextStyle(color:Colors.black,fontSize: 15.0)),
                              //SizedBox(height: 7.0,),
                              //Text("Canvas upper",style:TextStyle(color:Colors.black,fontSize: 15.0)),
                             // SizedBox(height: 7.0,),
                              //Text("Wipe with a clean, dry cloth when needed",style:TextStyle(color:Colors.black,fontSize: 15.0)),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height*0.8,
                          child: Row(
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height*0.11,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(5.0)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.495,
                                          height: MediaQuery.of(context).size.height,
                                          child:  RaisedButton(
                                              onPressed: (){}, color: Colors.white,
                                              child: Text("ADD TO BAG", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),)
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.492,
                                          height: MediaQuery.of(context).size.height,
                                          child:  RaisedButton(
                                              onPressed: (){

                                              },
                                              color: Colors.black,
                                              child: Text("BUY NOW", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),)
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              )
                            ],
                          )
                      )
                    ],
                  )
                ],
              ),
            )
        )
    );
  }
}

class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 7.0,
      width: 7.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}