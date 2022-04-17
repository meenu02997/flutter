import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:prestashop/detail.dart';


class CarouselView extends StatefulWidget {
  @override
  _CarouselViewState createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {

  var titleList = [
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
  ];



  @override
  Widget build(BuildContext context) {
    return Container(
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
        items: imgList.map(
                (url){
              return Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                    url,
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
            prductss(),
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

              padding: EdgeInsets.only(top:10.0),
              child: Text(
                "New Products",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            prosdes(),
          ],
        )
    );
  }

  // ignore: non_constant_identifier_names
  Widget BestSellers(){
    return Material(
        color: Colors.white,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top:10.0),
              child: Text(
                "BestSellers",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            prosdes(),
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
            prosdes(),
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
            prosdes(),
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
            prosdes(),
          ],
        )
    );
  }



  Widget prosdes(){
    return Container(
      height: 175.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          //scrollDirection: Axis.horizontal,
          itemCount: imgList.length,
          itemBuilder:(BuildContext context, index){
            return Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //GestureDetector()
                            Card(
                              shadowColor: Colors.black26,
                              child: Container(
                                  width: MediaQuery.of(context).size.width*0.3,
                                  height: MediaQuery.of(context).size.height*0.15,
                                  child:GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => second())
                                      );
                                    },
                                    child: Image(
                                      image: NetworkImage(imgList[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                              ),
                            ),
                            Expanded(child: Text(
                              desList[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            ))
                          ]
                      ),
                    )
                )],
            );
          }
      ),
    );
  }

  /* Widget labelContainer(String s){}*/

  Widget productss(){
    return Container(
      height: 160.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          //scrollDirection: Axis.horizontal,
          itemCount: imgList.length,
          itemBuilder:(BuildContext context, index){
            return Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    child: Column(
                        children: <Widget>[
                          Card(
                            shadowColor: Colors.black26,
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.3,
                              height: MediaQuery.of(context).size.height*0.15,
                              child: Image(
                                image: NetworkImage(imgList[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(child: Text(
                            titleList[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ))
                        ]
                    )
                )],
            );
          }
      ),
    );
  }

  Widget GridSection(){
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
      child: GridView.builder(
          itemCount: imgList.length,
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
                              imgList[index],
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text("hello"),
                        ),
                      )
                    ],
                  ),
                  /*Container(
                    //color: Colors.green,
                    height: MediaQuery.of(context).size.height*0.08,
                    // width: 200.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        //begin: Alignment.centerLeft,
                        //end: Alignment.centerRight,
                        colors: [Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.4)],
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:11.0, left: 7.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget> [
                              Expanded(
                                child: Text(
                                  titleList[index],
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),),
                              SizedBox(height: 2,),
                              Expanded(
                                  child: Text(
                                    desList[index],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  )
                              )
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width*0.2,
                            margin: EdgeInsets.only(left:8.0,),
                            padding: EdgeInsets.only(left:20.0,top:15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.star_border,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],)
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          // padding: EdgeInsets.only(left:25.0),
                          //color: Colors.blue,
                        )
                      ],
                    ),
                  )*/
                ]
            );
          }
      ),
    );
  }


  Widget prductss(){
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        //scrollDirection: Axis.horizontal,
        itemCount: imgList.length,
        itemBuilder:(BuildContext context, index){
          return Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height*0.25,
                  child: Column(
                      children: <Widget>[
                        Card(
                          shadowColor: Colors.black26,
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.3,
                            height: MediaQuery.of(context).size.height*0.15,
                            child: Image(
                              image: NetworkImage(imgList[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(child: Text(
                          titleList[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ))
                      ]
                  )
              )],
          );
        }
    );
  }

}