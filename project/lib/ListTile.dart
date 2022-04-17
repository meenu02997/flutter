import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:meenu_mega_test/Models/Model1.dart';
import 'package:meenu_mega_test/MovieDetails.dart';
import 'package:meenu_mega_test/MovieListScreen.dart';


class MovieListTile extends StatefulWidget {

  @override
  _MovieListTileState createState() => _MovieListTileState();
}

class _MovieListTileState extends State<MovieListTile> {

  Welcome w = new Welcome();
  bool isSearching = false;

  var url = Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=50e4bdab411de06d008a322b7c13e290&language=en-US&query=Friends&page=1");
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



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.amber,
      child: ListView(
          children:[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.73,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: ListView.builder(
                      itemCount: w.results.length,
                      itemBuilder: (context,index){
                        return Card(

                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => MovieDetails())
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
                        );
                      }
                  ),
                ),
                //SizedBox(height: 10.0,),
              ],
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                color: Colors.pink,
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
          ]
      ),
    );
}}
