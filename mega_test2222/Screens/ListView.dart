import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  //const ListViewScreen({Key? key}) : super(key: key);

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {

  var titleList = [
    """The best is yet to come'
Framed poster
\$30""",
    """The adventure begins
Framed poster
\$30""",
    """Today is a good day
Framed poster
\$30""",
    """Mug The best is yet
to come
\$12""",
    """Mug The adventure
begins
\$12""",
    """Mug Today is a good
day
\$12""",
    """Mountain fox cushion
Framed poster
\$20""",
    """Hummingbird cushion
\$20""",

    """Mountain fox - Vector
graphics
\$10""",

    """Brown bear - Vector
graphics
\$9""",
  ];

  /* var desList = [
    "\$30",
    "\$30",
    "\$30",
    "\$12",
    "\$12",
    "\$12",
    "\$20",
    "\$20",
    "\$10",
    "\$9",
  ];*/

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
    // return ListView.builder(
    //
    //   itemCount: imgList.length,
    //   itemBuilder: (context, index){
    //     return Card(
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(13.0))
    //       ),
    //       margin: EdgeInsets.all(7.0),
    //       shadowColor: Colors.white,
    //       elevation: 5,
    //
    //       child: Row(
    //           children: <Widget>[
    //
    //             Container(
    //                 padding: EdgeInsets.only(top: 4.0),
    //                 width: MediaQuery.of(context).size.width*0.39,
    //                 height: 140.0,
    //                 //color: Colors.grey[500],
    //                 margin: EdgeInsets.only(left:0.0),
    //
    //                 child: Image(
    //                   height: MediaQuery.of(context).size.height,
    //                   width: MediaQuery.of(context).size.width,
    //                   image: NetworkImage(imgList[index]),
    //                   //fit: BoxFit.fill,
    //                 )
    //             ),
    //
    //             Padding(
    //               padding: const EdgeInsets.only(top:4.0),
    //
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   Text(
    //                     titleList[index],
    //                     style: TextStyle(
    //                       fontSize: 16.0,
    //                       color: Colors.black,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Row(
    //               children: [
    //                 Container(
    //                     width: MediaQuery.of(context).size.width*0.1,
    //                     // height: MediaQuery.of(context).size.height*0.2,
    //                     margin: EdgeInsets.only(left:8.0,),
    //                     padding: EdgeInsets.only(left:20.0,top:15.0),
    //
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //
    //                       children: <Widget>[
    //
    //                         Icon(Icons.shopping_bag_sharp,
    //                           color: Colors.black,
    //                           size: 24.0,
    //                         ),
    //                       ],)
    //                 ),
    //               ],
    //             )
    //           ]
    //       ),
    //     );
    //   },
    // );
  }
}
