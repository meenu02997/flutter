import 'package:flutter/material.dart';
import 'package:prestashop/Shopping_Cart.dart';
import 'package:prestashop/caresolview.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current=0;
  //final CategoriesScroller categoriesScroller = CategoriesScroller();
  //ScrollController controller = ScrollController();

  var imgList = [
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/3-3.jpg",
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/4-4.jpg",
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/5-5.jpg",
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/6-6.jpg",
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/7-7.jpg",
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/8-8.jpg",
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/9-9.jpg",
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/11-13.jpg",
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/12-15.jpg",
    "https://prestashop.webkul.com/ps17/ps17-moduledemo/modules/mobikul/views/img/resized/products/432/13-16.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: SafeArea(

          child: Scaffold(
            //backgroundColor: Colors.red,
              appBar: AppBar(
                elevation: 0,

                leading: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),

                actions: <Widget>[
                  IconButton(icon: Icon(Icons.search, color: Colors.black,),
                    onPressed: (){},
                  ),

                  IconButton(icon: Icon(Icons.shopping_cart, color: Colors.black,),
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart())
                      );
                    },
                  ),
                ],

                title: Text(
                  "Prestashop Mobikul",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                backgroundColor: Colors.purple,
                toolbarHeight: 80.0,
              ),

              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.black,
                currentIndex: _current,
                onTap: (index){
                  setState(() {
                    _current=index;
                  });
                },

                items: const <BottomNavigationBarItem>[

                  BottomNavigationBarItem(
                    backgroundColor: Colors.purple,
                    icon: Icon(
                      Icons.home,
                      // color: Colors.black,
                    ),
                    label: 'Home',
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.category,
                      //color: Colors.black,
                    ),
                    label: 'Categories',
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications,
                      // color: Colors.black,
                    ),
                    label: 'Notifications',
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.perm_identity_outlined,
                      // color: Colors.black,
                    ),
                    label: 'Account',
                  ),
                ],
              ),
              body: TabBarView(
                children: <Widget>[
                  CarouselView(),
                ],
              )
            /*ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imgList.length,
                    itemBuilder:(BuildContext context, index){
                      return Stack(

                        children: [
                          Container(
                            child: Column(
                              children: <Widget>[
                                Card(

                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.35,
                                    height: MediaQuery.of(context).size.height*0.25,
                                    child: Image(
                                      image: NetworkImage(imgList[index]),
                                    ),
                                  ),
                                ),
                                    ]
                                )
                          )],
                            );
                      }),*/

          ),
        )
    );
  }

}
