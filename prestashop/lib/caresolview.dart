import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:prestashop/detail.dart';
import 'package:http/http.dart' as http;
import 'package:prestashop/icons.dart';
import 'Model1.dart';


class CarouselView extends StatefulWidget {
  @override
  _CarouselViewState createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  Welcome w = new Welcome();

  var url = Uri.parse("https://prestashop.webkul.com/ps17/ps-mobikul/api/mobikul/gethomepage?width=1080&ws_key=PXIHTSBPK7781D2M6SB4C5IV9SRJ832Z&outputformat=json");
  bool circular=true;

  Future<Welcome> fetch() async{
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    if(res.statusCode==200)
    {
      print(res.statusCode);
      print(res.body);
      setState(()
      {
        circular= false;
        w = Welcome.fromJson(data);
      }
      );
    }
    return w;
  }
  @override
  void initState() {
    // TODO: implement initState
    fetch();
    super.initState();
  }

 /* var titleList = [
    "ACCESSORIES",
    "MEN",
    "WOMEN",
    "ART",
    "FOOTWEAR",
  ];

  var desList = [
    """Product 1
£35.32""",
    """Product 2
£24.2""",
    """Product 3
£15.02""",
    """Product 4
£55.22""",
  ];

  final List<String> imgList = [
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/3-3.jpg",
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/4-4.jpg",
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/5-5.jpg",
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/6-6.jpg",
    //"https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/7-7.jpg",
    //"https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/8-8.jpg",
    //"https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/9-9.jpg",
    //"https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/11-13.jpg",
    //"https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/12-15.jpg",
    //"https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/13-16.jpg",
  ];*/


  @override
  Widget build(BuildContext context) {
    return circular? Center(child: CircularProgressIndicator()):
    /*RefreshIndicator(
        onRefresh: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
          return Future.value(false);
        },
        child:*/ Container(
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Products(),
              //ImageContainer(),
              SizedBox(
                height: 5.0,
              ),
              CarouselContainer(),
              SizedBox(height: 10.0,),
              NewProducts(),
              SizedBox(height: 10.0,),
              BestSellers(),
              SizedBox(height: 10.0,),
              PopularProducts(),
              SizedBox(height: 10.0,),
              OnSale(),
              SizedBox(height: 10.0,),
              StaticImage1(),
              SizedBox(height: 10.0,),
              StaticImage2(),
              SizedBox(height: 10.0,),
              Album(),
              SizedBox(height: 10.0,),
              Cushions(),
              SizedBox(height: 10.0,),
              RecentlyViewed(),
            ],
          ),
        );
  }

  /*Widget ImageContainer(){
    return Container(
        child: Column(
            children: <Widget>[
              Card(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  height: MediaQuery.of(context).size.height*0.25,
                  child: Image(
                    image: NetworkImage("https://m9v6g2a7.rocketcdn.me/wp-content/uploads/2021/03/Shiv-Wallpaper-HD-Download-For-Android-Mobile-iPhone-Lord-Shiva-images-3D.jpg"),
                  ),
                ),
              ),
            ]
        )
    );
 }*/

  Widget CarouselContainer(){

    return CarouselSlider(
        items: w.slider.slide.map(
                (url){
              return Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                    w.slider.slide[0].imageLink,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                ),
              );
            }
        ).toList(),
        options: CarouselOptions(
          aspectRatio: 2.0,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          scrollDirection: Axis.horizontal,

        )
    );
  }

  Widget Products(){
    return Material(
        color: Colors.white,
        elevation: 0.0,
        child: Column(
          children: [
            productss(),
            /*Padding(
              padding: EdgeInsets.all(2.0),
              child: Text("New Products"),
          ),*/
          ],
        )
    );
  }


  Widget NewProducts(){
    return Material(
        color: Colors.white,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                w.modProductSliders.modProductSlider[0].title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                "VIEW ALL",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0),
              ),
              margin: EdgeInsets.only( right: 10.0),
            ),
            // w.modProductSliders.modProductSlider[0].title,
            prosdes1(),
          ],
        )
    );
  }

  Widget BestSellers(){
    return Material(
        color: Colors.white,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top:5.0),
              child: Container(
                child: Text(
                  "BestSellers",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                "VIEW ALL",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0),
              ),
              margin: EdgeInsets.only(top: 5.0, right: 10.0),
            ),
            prosdes2(),
          ],
        )
    );
  }

  Widget PopularProducts(){
    return Material(
        color: Colors.white,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top:10.0),
              child: Text(
                "Popular Products",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            prosdes3(),
          ],
        )
    );
  }

  Widget OnSale(){
    return Material(
        color: Colors.white,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top:10.0),
              child: Text(
                "On Sale",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            prosdes4(),
          ],
        )
    );
  }

  Widget StaticImage1(){
    return Container(
      height: 250.0,
      child: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZLP3GWbBhQNvWEeSbjThlPULkanIAyByUHA&usqp=CAU',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget StaticImage2(){
    return Container(
      height: 250.0,
      child: Image.network(
        'https://blog.buzzoole.com/wp-content/uploads/2017/03/Menswear-post-def2.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget Album(){
    return Material(
        color: Colors.white,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top:10.0),
              child: Text(
                "Frames & Albums",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridSection(),
          ],
        )
    );
  }

  Widget Cushions(){
    return Material(
        color: Colors.white,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top:10.0),
              child: Text(
                "Cushions",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridSection(),
          ],
        )
    );
  }

  Widget RecentlyViewed(){
    return Material(
        color: Colors.white,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top:10.0),
              child: Text(
                "Recently Viewed",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            prosdes1(),
          ],
        )
    );
  }

  Widget prosdes1(){

    return Stack(
        children:[
          Container(
            height: MediaQuery.of(context).size.height * 0.28,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                //scrollDirection: Axis.horizontal,
                itemCount: w.modProductSliders.modProductSlider[0].modProductList.modProduct.length,
                itemBuilder:(BuildContext context, index){
                  return Container(
                      width: 170,
                      margin: EdgeInsets.all(3.0),
                      color: Colors.amber,
                      height: MediaQuery.of(context).size.height*0.25,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Card(
                                shadowColor: Colors.black26,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => second())
                                    );
                                  },
                                  child: Image(
                                    image: NetworkImage(w.modProductSliders.modProductSlider[index].modProductList.modProduct[index].imageLink),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              margin: EdgeInsets.all(7.0),
                              // height: 130,
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.28,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(left: 15.0,right: 10.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      w.modProductSliders.modProductSlider[0].modProductList.modProduct[index].name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.0,
                                          fontWeight:
                                          FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      w.modProductSliders.modProductSlider[0].modProductList.modProduct[index].price,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.0,
                                          fontWeight:
                                          FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  );
                }
            ),
            //width: MediaQuery.of(context).size.width,
          ),

        ]
    );
  }

  Widget prosdes2(){
    return Stack(
        children:[
          Container(
            color: Color(0xffe5e5e5),
            height: MediaQuery.of(context).size.height * 0.28,
            width: MediaQuery.of(context).size.width,
            //color: Colors.white,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                //scrollDirection: Axis.horizontal,
                itemCount: w.modProductSliders.modProductSlider[1].modProductList.modProduct.length,
                itemBuilder:(BuildContext context, index){
                  return Container(
                      color: Color(0xffe5e5e5),
                      width: 170,
                      margin: EdgeInsets.all(3.0),
                      //color: Colors.white,
                      height: MediaQuery.of(context).size.height*0.25,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Card(
                                shadowColor: Colors.black26,
                                child: GestureDetector(
                                  onTap: (){
                                    /*Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => second())
                                    );*/
                                  },
                                  child: Image(
                                    image: NetworkImage(w.modProductSliders.modProductSlider[1].modProductList.modProduct[index].imageLink),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              margin: EdgeInsets.all(7.0),
                              height: MediaQuery.of(context).size.height*0.15,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.28,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(left: 15.0,right: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      w.modProductSliders.modProductSlider[1].modProductList.modProduct[index].name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                          fontWeight:
                                          FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      w.modProductSliders.modProductSlider[1].modProductList.modProduct[index].price,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.0,
                                          fontWeight:
                                          FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  );
                }
            ),
            //width: MediaQuery.of(context).size.width,
          ),

        ]
    );
  }

  Widget prosdes3(){
    return Stack(
        children:[
          Container(
            color: Color(0xffe5e5e5),
            height: MediaQuery.of(context).size.height * 0.28,
            width: MediaQuery.of(context).size.width,
            //color: Colors.white,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                //scrollDirection: Axis.horizontal,
                itemCount: w.modProductSliders.modProductSlider[2].modProductList.modProduct.length,
                itemBuilder:(BuildContext context, index){
                  return Container(
                      color: Color(0xffe5e5e5),
                      width: 170,
                      margin: EdgeInsets.all(3.0),
                      //color: Colors.white,
                      height: MediaQuery.of(context).size.height*0.25,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Card(
                                shadowColor: Colors.black26,
                                child: GestureDetector(
                                  onTap: (){
                                    /*Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => second())
                                    );*/
                                  },
                                  child: Image(
                                    image: NetworkImage(w.modProductSliders.modProductSlider[2].modProductList.modProduct[index].imageLink),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              margin: EdgeInsets.all(7.0),
                              height: MediaQuery.of(context).size.height*0.15,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.28,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(left: 15.0,right: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      w.modProductSliders.modProductSlider[2].modProductList.modProduct[index].name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                          fontWeight:
                                          FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      w.modProductSliders.modProductSlider[2].modProductList.modProduct[index].price,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.0,
                                          fontWeight:
                                          FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  );
                }
            ),
            //width: MediaQuery.of(context).size.width,
          ),

        ]
    );
  }

  Widget prosdes4(){
    return Stack(
        children:[
          Container(
            color: Color(0xffe5e5e5),
            height: MediaQuery.of(context).size.height * 0.28,
            width: MediaQuery.of(context).size.width,
            //color: Colors.white,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                //scrollDirection: Axis.horizontal,
                itemCount: w.modProductSliders.modProductSlider[3].modProductList.modProduct.length,
                itemBuilder:(BuildContext context, index){
                  return Container(
                      color: Color(0xffe5e5e5),
                      width: 170,
                      margin: EdgeInsets.all(3.0),
                      //color: Colors.white,
                      height: MediaQuery.of(context).size.height*0.25,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Card(
                                shadowColor: Colors.black26,
                                child: GestureDetector(
                                  onTap: (){
                                    /*Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => second())
                                    );*/
                                  },
                                  child: Image(
                                    image: NetworkImage(w.modProductSliders.modProductSlider[3].modProductList.modProduct[index].imageLink),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              margin: EdgeInsets.all(7.0),
                              height: MediaQuery.of(context).size.height*0.15,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.28,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(left: 15.0,right: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      w.modProductSliders.modProductSlider[3].modProductList.modProduct[index].name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                          fontWeight:
                                          FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      w.modProductSliders.modProductSlider[3].modProductList.modProduct[index].price,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.0,
                                          fontWeight:
                                          FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  );
                }
            ),
            //width: MediaQuery.of(context).size.width,
          ),

        ]
    );
  }

  /* Widget labelContainer(String s){}*/


  Widget productss(){
    return Stack(
        children:[
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 5.0),
            padding: EdgeInsets.all(3.0),
            height: MediaQuery.of(context).size.height * 0.225,
            child: ListView.builder(
                addAutomaticKeepAlives: true,
                scrollDirection: Axis.horizontal,
                itemCount: w.menuCategory.rootCategory.length,
                itemBuilder:(BuildContext context, index){
                  return Container(
                    margin: EdgeInsets.all(3.0),
                    color: Colors.black12,
                    height: MediaQuery.of(context).size.height*0.225,
                    child:Card(
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.8,
                              child:  Image.network(w.menuCategory.rootCategory[index].imgIcon,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30.0,
                            child: Text(
                              w.menuCategory.rootCategory[index].name,
                              style:TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    width: 133,
                  );
                }
            ),
          ),
        ]
    );
  }

  Widget GridSection(){
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
      child: GridView.builder(
          itemCount: w.productBlock.block[0].products.product.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0
          ),
          //scrollDirection: Axis.vertical,
          // ignore: missing_return
          itemBuilder: (BuildContext context, index){
            //itemCount: livingThings.length;
            return Stack(
                alignment: Alignment.bottomCenter,
                //  fit: StackFit.expand,
                children: [
                  Column(
                    children: <Widget>[
                      Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.29,
                          height: MediaQuery.of(context).size.height*0.15,
                          child: Image.network(
                              w.productBlock.block[0].products.product[index].imageLink,
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                      Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(w.productBlock.block[0].products.product[index].name),
                            ),
                            ListTile(
                              title: Text(w.productBlock.block[0].products.product[index].name),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ]
            );
          }
      ),
    );
  }

}