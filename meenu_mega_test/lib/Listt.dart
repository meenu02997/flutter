import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meenu_mega_test/Dismissable_widget.dart';
import 'package:meenu_mega_test/Models/Model1.dart';
import 'package:meenu_mega_test/MovieDetails.dart';

class ListtScreen extends StatefulWidget {
  @override
  _ListtScreenState createState() => _ListtScreenState();
}

class _ListtScreenState extends State<ListtScreen> {
  bool isSearching = false;
  Dio dio = new Dio();

  Welcome w = new Welcome();
  //Welcome fiteredMovie=new Welcome(results: [],page: 0);

  bool circular = true;
  TextEditingController _searchController = TextEditingController();

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text(
    "MYNEWS",
    style: TextStyle(
        fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
  );

  Future<Welcome> fetch() async {
    Response response = await dio.get(
        //"https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3303e9abd82d4c50a96cc14ea82315de"
        "https://newsapi.org/v2/everything?q=tesla&from=2021-08-09&sortBy=publishedAt&apiKey=3303e9abd82d4c50a96cc14ea82315de"
        //     "https://api.themoviedb.org/3/movie/popular?", queryParameters: {
        // "api_key": "50e4bdab411de06d008a322b7c13e290",
        // "language": "en-US"
        //https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=3303e9abd82d4c50a96cc14ea82315de
        //   }
        );
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
    // TODO: implement initState
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 20),
      //height: MediaQuery.of(context).size.height * 0.7,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.pink,
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
                            builder: (context) => MovieDetails(
                                  posterpath: w.articles[index].source.name,
                                  original_title: w.articles[index].title,
                                  overview: w.articles[index].description,
                                  release_date:
                                      w.articles[index].publishedAt.toString(),
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      //margin: EdgeInsets.all(20),
                      child: ListTile(
                        // leading:
                        // ConstrainedBox(
                        //   constraints: BoxConstraints(
                        //     maxWidth: MediaQuery.of(context).size.width *0.28,
                        //     maxHeight: MediaQuery.of(context).size.width * 0.28,
                        //   ),
                        //   child: Image.network(
                        //       w.articles[index].urlToImage,
                        //       fit: BoxFit.fill),
                        // ),
                        //leading: Image.network('${"https://image.tmdb.org/t/p/w500/"}'+w.results[index].backdropPath),
                        title: Text(
                          w.articles[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        subtitle: Text(
                          w.articles[index].publishedAt.timeZoneName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.28,
                            maxHeight: MediaQuery.of(context).size.width * 0.28,
                          ),
                          child: Image.network(w.articles[index].urlToImage,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
