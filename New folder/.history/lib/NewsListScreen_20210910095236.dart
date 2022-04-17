import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meenu_mega_test/Dismissable_widget.dart';
import 'package:meenu_mega_test/Models/Model1.dart';
import 'package:meenu_mega_test/NewsDetails.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key key}) : super(key: key);

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  bool isSearching = false;
  Dio dio = new Dio();

  Welcome w = new Welcome();

  bool circular = true;
  TextEditingController _searchController = TextEditingController();

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text(
    "MyNEWS",
    style: TextStyle(
        fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
  );

  Future<Welcome> fetch() async {
    Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=apple&from=2021-09-08&to=2021-09-08&sortBy=popularity&apiKey=b4ad155890b44f55b4f14bdbb02de7e6");
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.data);
      setState(() {
        MovieSearch = w = Welcome.fromJson(response.data);
        circular = false;
      });
    }
    return w;
  }

  // ignore: non_constant_identifier_names
  Welcome MovieSearch = Welcome();
  Future<Welcome> searchFetch(String val) async {
    Response response = await dio
        .get("https://api.themoviedb.org/3/search/movie?", queryParameters: {
      "api_key": "50e4bdab411de06d008a322b7c13e290",
      "language": "en-US",
      "query": _searchController.text,
      "page": "1"
    });
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.data);
      setState(() {
        MovieSearch = Welcome.fromJson(response.data);
        circular = false;
      });
    }
    return MovieSearch;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: cusSearchBar,
          //bottom: ,
          //bottom: ,
          actions: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 39, right: 8.0),
                  child: Text(
                    "LOCATION",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.location_on),
                      onPressed: () {
                        setState(() {
                          this.isSearching = true;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        "INDIA",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
          backgroundColor: HexColor("#0c55be"),
          toolbarHeight: 100.0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tripEditModelBottamSheet(context);
          },
          child: const Icon(
            Icons.filter_alt,
          ),
          backgroundColor: HexColor("#0c55be"),
        ),
        body: circular
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(5),
                    color: Colors.green,
                    child: Material(
                      elevation: 5,
                      child: TextField(
                        onChanged: (value) {
                          searchFetch(value);
                        },
                        controller: _searchController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffix: isSearching
                              ? IconButton(
                                  icon: Icon(Icons.cancel),
                                  onPressed: () {
                                    setState(() {
                                      this.isSearching = false;
                                    });
                                  },
                                )
                              : IconButton(
                                  icon: cusIcon,
                                  onPressed: () {
                                    setState(() {
                                      this.isSearching = true;
                                    });
                                  },
                                ),
                          border: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.black, width: 5),
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: "Search for news,topics...",
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TopHeadlines",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        Text(
                          "Sort: Newest",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_drop_down_sharp),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Stack(children: <Widget>[
                    Container(
                      //margin: EdgeInsets.symmetric(horizontal: 20),
                      //height: MediaQuery.of(context).size.height * 0.7,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: HexColor("#f5f8fd"),
                      child: ListView.builder(
                          itemCount: w.articles.length,
                          itemBuilder: (context, index) {
                            final item = w.articles[index];
                            return DissmissableWidget(
                              item: item,
                              child: Card(
                                margin: EdgeInsets.all(9),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NewsDetails(
                                                posterpath: w
                                                    .articles[index].urlToImage,
                                                original_title:
                                                    w.articles[index].author,
                                                overview: w.articles[index]
                                                    .description,
                                                release_date: w
                                                    .articles[index].publishedAt
                                                    .toString(),
                                                Contentt: w
                                                    .articles[index].content)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                        height: 130,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        //margin: EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      w.articles[index].author,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      w.articles[index]
                                                          .description,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      w.articles[index].content,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20),
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                  ),
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(w
                                                          .articles[index]
                                                          .urlToImage))),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ]),
                ],
              ));
  }

  void _tripEditModelBottamSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 3.0,
            ),
            child: Container(
                height: MediaQuery.of(context).size.height * .50,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 3.0, top: 3.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Filter by sources',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'NewSource 1',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.check_box_outline_blank_outlined,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'NewSource 2',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.check_box_outline_blank_outlined,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'NewSource 3',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.check_box_outline_blank_outlined,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'NewSource 4',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.check_box_outline_blank_outlined,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'NewSource 5',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.check_box_outline_blank_outlined,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'NewSource 6',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(
                                Icons.check_box_outline_blank_outlined,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            color: Colors.blue,
                            height: 30,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                                color: HexColor("#0c55be"),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Apply",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                onPressed: () {})),
                      )

                      // ignore: deprecated_member_use
                    ],
                  ),
                )),
          );
        });
  }
}
