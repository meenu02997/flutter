import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mega_test2222/Model/ModelFOrAddToCartAPI.dart';
import 'package:mega_test2222/Screens/Shopping_Cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mega_test2222/Model/ModelForProductLIstAPI.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  Dio dio=new Dio();
  bool isGridView=true;
  bool circular=true;
  var offset = 0;
  var limit = 10;
  //controller
  ScrollController _scrollController = ScrollController();
  //model obj
  ProductListApiModel ProductListApi = ProductListApiModel();
  //Base url
  String url="https://demo.webkul.com/mobikul/sliderProducts/1";

  Future<ProductListApiModel> fetchProductlistApi()async
  {
    SharedPreferences preferences= await SharedPreferences.getInstance();
    var encoded=preferences.getString("loginKey");
    print(encoded);
    Response response=await dio.post(Uri.encodeFull(url), options: Options(
        headers: {"Authorization":"Basic bGl2ZVNlY3JldEtleTpsaXZlU2VjcmV0S2V5",
          "Login":"$encoded",
          "lang":"en_US",
          "Content-Type":"text/plain",
          "charset":"UTF-8",
        }),
        data: {"offset": 0, "limit": 10}
    );
    if(response.statusCode==200)
    {
      setState(() {
        circular=false;
      });
      print("hello Meenu.....");
      ProductListApi=ProductListApiModel.fromJson(response.data);
      print(response.data);
    }
    return ProductListApi;
  }
//Add to cart API....

  AddtoCartApiModel addtocartAPI;
  Future<AddtoCartApiModel> cartAddApi(int id)async
  {
    SharedPreferences preferences= await SharedPreferences.getInstance();
    var encoded=preferences.getString("loginKey");
    Map<String, String> body = {'productId': '$id', 'add_qty': '1'};
    String body1 = jsonEncode(body);
    Map<String, String> _headers = {
      'Authorization': 'Basic bGl2ZVNlY3JldEtleTpsaXZlU2VjcmV0S2V5',
      'Login': '$encoded',
      'lang': 'en_US',
      'content-type': 'text/plain',};
    BaseOptions _baseOptions = BaseOptions(headers: _headers);
    Dio dio = Dio(_baseOptions);
    String url="https://demo.webkul.com/mobikul/mycart/addToCart";
    print(encoded);
    Response responseApi2=await dio.post(Uri.encodeFull(url),data: body1
    );
    if(responseApi2.statusCode==200)
    {
      addtocartAPI=AddtoCartApiModel.fromJson(responseApi2.data);
      print(responseApi2.data);
      print("${id} added to cart");
    }
    return addtocartAPI;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProductlistApi();
    initializeScrollController();
  }

  void initializeScrollController() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if(_scrollController.hasClients && _scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        offset = offset + 1;
        fetchProductlistApi();
      }
    });
  }

  gridView(Orientation orientation){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child:  GridView.builder(
          itemCount: ProductListApi.products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2:3,
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
            //childAspectRatio: 0.5,
          ),
          scrollDirection: Axis.vertical,
          // ignore: missing_return
          itemBuilder: (BuildContext context, index){
            return  Card(
                child:Stack(
                    alignment: Alignment.bottomCenter,
                    //  fit: StackFit.expand,
                    children:<Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            //fit: BoxFit.fill,
                            image: NetworkImage(ProductListApi.products[index].thumbNail
                            ),
                          )
                      ),
                      SizedBox(height: 16.0,),
                      Container(
                        //color: Colors.green,
                        height: MediaQuery.of(context).size.height*0.06,
                        // width: 200.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.white, Colors.white],),
                        ),

                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:11.0, left: 7.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget> [
                                    Expanded(
                                      child: Text(
                                        ProductListApi.products[index].name,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 2.0,),
                                  ],
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.1,
                                  margin: EdgeInsets.only(left:8.0,),
                                  padding: EdgeInsets.only(left:20.0,top:15.0),

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.shopping_bag_rounded,
                                        color: Colors.black,
                                        size: 24.0,
                                      ),
                                    ],)

                              )
                            ],
                          ),
                        ),
                      )
                    ])
            );
          }
      ),
    );
  }

  listView(){
    return ListView.builder(
      controller: _scrollController,
      itemCount: ProductListApi.products.length+1,
      itemBuilder: (context, index){
        if (index < ProductListApi.products.length) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(13.0))
            ),
            margin: EdgeInsets.all(7.0),
            shadowColor: Colors.white,
            elevation: 5,

            child: Row(
                children: <Widget>[

                  Container(
                      padding: EdgeInsets.only(top: 4.0),
                      width: MediaQuery.of(context).size.width*0.33,
                      height: 140.0,
                      //color: Colors.grey[500],
                      margin: EdgeInsets.only(left:0.0),

                      child: Image(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        image: NetworkImage(ProductListApi.products[index].thumbNail),
                        //fit: BoxFit.fill,
                      )
                  ),

                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top:0.2),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width*0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  ProductListApi.products[index].name,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2.0,),
                                Text(
                                  ProductListApi.products[index].priceUnit,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width*0.1,
                              child: GestureDetector(
                                child: Icon(Icons.shopping_bag_sharp,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                                onTap: ()async{
                                  await cartAddApi(ProductListApi.products[index].productId);
                                  setState(() {
                                    fetchProductlistApi();
                                  });
                                  Fluttertoast.showToast(msg: addtocartAPI.message,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.purple,
                                      textColor: Colors.white,
                                      fontSize: 18.0);
                                },
                              )
                          )
                        ],
                      ),
                    ),
                  ),

                ]
            ),
          );
        }else if(index==ProductListApi.products.length) {
          return Center(child: CircularProgressIndicator());
        }else{
          print('there is nothing to load more');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "Product List",
            style: TextStyle(fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.bold),),

          actions: <Widget>[
            IconButton(icon: Icon(Icons.search, color: Colors.white,),
              onPressed: (){},
            ),

            Stack(
              children: [
                InkWell(
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: ()
                    {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
                    },
                  ),
                ),
                ProductListApi.cartCount!=null && ProductListApi.cartCount!=0?
                Positioned(
                  right: 8,
                  top: 6,
                  child: new Container(
                    padding: EdgeInsets.all(4),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(minWidth: 18, minHeight: 18,),
                    child: Text(ProductListApi.cartCount.toString(), style: new TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ):Container()
              ],
            )
          ],
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          child: isGridView?Icon(
            Icons.grid_on,
          ):Icon(Icons.list),
          backgroundColor: Colors.purple,
          onPressed: () {
            setState(() {
              if (isGridView) {
                isGridView = false;
              } else {
                isGridView = true;
              }
            });
          },
        ),
        body:circular
            ? Center(child: CircularProgressIndicator(),
        )
        :( isGridView ? listView()
        :gridView(orientation)
        )
    );
  }}
