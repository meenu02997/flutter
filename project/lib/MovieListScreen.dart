import 'package:meenu_mega_test/Dismissable_widget.dart';
import 'package:meenu_mega_test/Models/Model.dart';
import 'package:meenu_mega_test/Models/Model1.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:json_annotation/json_annotation.dart';

//import 'MovieListDetail.dart';
import 'package:meenu_mega_test/MovieListScreen.dart';
import 'package:meenu_mega_test/MovieDetails.dart';


class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  bool isSearching=false;
  Dio dio=new Dio();

  Welcome w=new Welcome(results: [],page: 0);
  //Welcome fiteredMovie=new Welcome(results: [],page: 0);

  bool circular=true;
  TextEditingController _searchController =TextEditingController();

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("AppBar",style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),);

  Future<Welcome> fetch()async{
    Response response=await dio.get("https://api.themoviedb.org/3/movie/popular?",queryParameters: {
      "api_key":"50e4bdab411de06d008a322b7c13e290",
      "language":"en-US"
    });
    if(response.statusCode==200)
    {
      print(response.statusCode);
      print(response.data);
      setState(() {
        MovieSearch= w=Welcome.fromJson(response.data);
        circular=false;
      });}
    return w;
  }
  Welcome MovieSearch=Welcome(page: 0, results: []);
  Future<Welcome> searchFetch(String val)async{
    Response response=await dio.get("https://api.themoviedb.org/3/search/movie?",queryParameters: {
      "api_key":"50e4bdab411de06d008a322b7c13e290",
      "language":"en-US",
      "query":_searchController.text,
      "page":"1"
    });
    if(response.statusCode==200)
    {
      print(response.statusCode);
      print(response.data);
      setState(() {
        MovieSearch=Welcome.fromJson(response.data);
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
    return Scaffold(
        appBar: AppBar(
          title: !isSearching
              ?cusSearchBar:TextField(
            onChanged: (value){
              searchFetch(value);
            },
            controller: _searchController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              icon: Icon(Icons.search,color: Colors.white,),
              hintText: "Search Movie here",
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            isSearching?
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: ()
              {
                setState(() {

                  this.isSearching=false;
                });
              },
            ):
            IconButton(
              icon: cusIcon,
              onPressed: ()
              {
                setState(() {
                  this.isSearching=true;

                });
              },
            )
          ],
          backgroundColor: Colors.amber,
          toolbarHeight: 80.0,
        ),
        body:circular?Center(child: CircularProgressIndicator(),): ListView(
          children:<Widget> [
            Stack(
                children:<Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                    child: ListView.builder(
                        itemCount: w.results.length,
                        itemBuilder: (context,index){
                          final item = w.results[index];
                          return DissmissableWidget(
                            item: item,
                            child: Card(

                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => MovieDetails(posterpath: w.results[index].posterPath,
                                        original_title: w.results[index].originalTitle,overview: w.results[index].overview,
                                        release_date: w.results[index].releaseDate.toString(),))
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ListTile(

                                    leading: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: MediaQuery.of(context).size.width * 0.28,
                                        maxHeight: MediaQuery.of(context).size.width * 0.28,
                                      ),
                                      child: Image.network('${"https://image.tmdb.org/t/p/w500/"}'+w.results[index].backdropPath, fit: BoxFit.fill),
                                    ),
                                    //leading: Image.network('${"https://image.tmdb.org/t/p/w500/"}'+w.results[index].backdropPath),
                                    title: Text(w.results[index].title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    subtitle: Text(w.results[index].releaseDate.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ]
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Text('Recent View',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                SizedBox(height: 5,),
                Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Stack(
                        children:[
                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            padding: EdgeInsets.all(3.0),
                            height: MediaQuery.of(context).size.height * 0.225,
                            child: ListView.builder(
                                addAutomaticKeepAlives: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: w.results.length,
                                //itemCount: imgList.length,
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
                                              child:  Image.network(
                                                //imgList[index],
                                                '${"https://image.tmdb.org/t/p/w500/"}'+w.results[index].backdropPath,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 30.0,
                                            child: Text(
                                              w.results[index].title,
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
                    )
                ),
              ],
            ),
          ],
        )
    );
  }
}