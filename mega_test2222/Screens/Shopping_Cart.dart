import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mega_test2222/Model/ModelForDeleteAPI.dart';
import 'package:mega_test2222/Model/ModelFOrCartDetails.dart';
import 'package:mega_test2222/Model/ModelForUpdateProduct.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool circular=true;
  ModelForCartApi cartObj;
  ModelForUpdateApi updateObj;
  ModelForDeleteApi delete;

  Dio dio=Dio();

  //API for Cart API....
  Future<ModelForCartApi> cartApiData()async
  {
    SharedPreferences preferences= await SharedPreferences.getInstance();
    var encoded=preferences.getString("loginKey");
    String Carturl="https://demo.webkul.com/mobikul/mycart";
    print(encoded);
    Response responseApi1=await dio.post(Uri.encodeFull(Carturl), options: Options(
        headers: {"Authorization":"Basic bGl2ZVNlY3JldEtleTpsaXZlU2VjcmV0S2V5",
            "Login":"$encoded",
            "lang":"en_US",
            "Content-Type":"text/plain",
            "charset":"UTF-8",}),
    );
    if(responseApi1.statusCode==200)
    {
      setState(() {
        circular=false;
      });
      cartObj=ModelForCartApi.fromJson(responseApi1.data);
      print(responseApi1.data);
    }
    return cartObj;
  }

//API for Update API....
  Future<ModelForUpdateApi> updateApiData(int value,int id)async
  {
    SharedPreferences preferences= await SharedPreferences.getInstance();
    var encoded=preferences.getString("loginKey");
    Map<String, String> body = {'set_qty': '$value'};
    String UpdateBody = jsonEncode(body);
    Map<String, String> headerss = {
      'Authorization': 'Basic bGl2ZVNlY3JldEtleTpsaXZlU2VjcmV0S2V5',
      'Login': '$encoded',
      'lang': 'en_US',
      'content-type': 'text/plain',};
    String updateurl="https://demo.webkul.com/mobikul/mycart/${id}";
    print(encoded);
    BaseOptions _baseOptions = BaseOptions(headers: headerss);
    Dio dio = Dio(_baseOptions);
    Response responseApi1=await dio.put(Uri.encodeFull(updateurl),data: UpdateBody);
    if(responseApi1.statusCode==200)
    {
      setState(() {
        circular=false;
      });
      updateObj=ModelForUpdateApi.fromJson(responseApi1.data);
      print(responseApi1.data);
    }
    return updateObj;
  }

//API for Delete API....
  Future<ModelForDeleteApi> deleteAPI(int id)async
  {
    SharedPreferences preferences= await SharedPreferences.getInstance();
    var encoded=preferences.getString("loginKey");
    String DltUrl="https://demo.webkul.com/mobikul/mycart/${id}";
    print(encoded);
    Response DltAPIresponse=await dio.delete(Uri.encodeFull(DltUrl), options: Options(
          headers: {"Authorization":"Basic bGl2ZVNlY3JldEtleTpsaXZlU2VjcmV0S2V5",
            "Login":"$encoded",
            "lang":"en_US",
            "Content-Type":"text/plain",
            "charset":"UTF-8",}),
    );
    if(DltAPIresponse.statusCode==200)
    {
      setState(() {
        circular=false;
      });
      delete=ModelForDeleteApi.fromJson(DltAPIresponse.data);
      print(DltAPIresponse.data);
    }
    return delete;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartApiData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(" Welcome to Shopping CartScreen"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: RaisedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Move to Next Screen')));
                },
                color:Colors.purple,
                textColor: Colors.white,
                child: Text('Proceed To Checkout',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
              ),
            ),
          ),
        ),
      ),
      body:circular?Center(child: CircularProgressIndicator(),):
      cartObj.items.length!= 0?ListView.builder(
          itemCount: cartObj.items.length,
          itemBuilder: (context, index) {
            final item = cartObj.items[index].lineId;
            return Dismissible(
              key: ValueKey(item),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13.0))),
                margin: EdgeInsets.all(7.0),
                shadowColor: Colors.white,
                elevation: 5,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.13,
                              width: MediaQuery.of(context).size.width*0.3,
                              color: Colors.red,
                              child: ClipRRect(
                              child: Image.network(cartObj.items[index].thumbNail, fit: BoxFit.cover,),
                                borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(13.0),
                                topLeft: Radius.circular(13.0)),
                               ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height*0.06,
                              width: MediaQuery.of(context).size.width*0.3,
                              color: Colors.white,
                              child: Container(
                                height: MediaQuery.of(context).size.height*0.07,
                                width: MediaQuery.of(context).size.width*0.3,
                                child: Row(
                                  children: <Widget>[
                                    Text('      QTY :  1',style: TextStyle(fontWeight: FontWeight.bold),),
                                    new DropdownButton<String>(
                                      items: <String>['1', '2','3','4','5','6','7','8','9'].map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value[0]),
                                        );
                                      }).toList(),
                                      onChanged: (_) {},
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.20,
                          width: MediaQuery.of(context).size.width*0.65,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 7.0,),
                                Text(cartObj.items[index].name,style:  TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                SizedBox(height: 2.5,),
                                Text(cartObj.items[index].priceUnit,style:  TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                SizedBox(height: 7.0,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    new Divider(
                      color: Colors.black26,
                      thickness: 1.0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.06,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left:65),
                        child: ListTile(
                          leading: InkWell(child: Icon(Icons.delete, color: Colors.black,),
                           onTap: ()async{
                            await deleteAPI(cartObj.items[index].lineId);
                              setState(() {
                                cartApiData();
                              });
                              Fluttertoast.showToast(msg: delete.message,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                              },
                          ),
                          title: Text("  "+'REMOVE ITEM',style: TextStyle(fontSize: 16),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }):Container(child: Center(child: Text("Cart is Empty",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.black),),),),
    );
  }
}