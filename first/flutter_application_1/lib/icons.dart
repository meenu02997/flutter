import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meenu_mega_test/ListTile.dart';
import 'package:meenu_mega_test/MovieListScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current=0;
  bool isSearching = false;
  //bool Movies = [];

  getMovies() async{
    var response = await Dio().get('https://api.themoviedb.org/3/search/movie?api_key=50e4bdab411de06d008a322b7c13e290&language=en-US&query=Friends&page=1');
    return response.data;
  }
  //final CategoriesScroller categoriesScroller = CategoriesScroller();
  //ScrollController controller = ScrollController();
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("AppBar",style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),);

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 1,
        child: SafeArea(

          child: Scaffold(
            //backgroundColor: Colors.red,
              appBar: AppBar(
                elevation: 0,

                title: !isSearching
                    ?cusSearchBar:TextField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                      // icon: Icon(
                      //     Icons.search,
                      //     color: Colors.black
                      // ),
                      hintText: 'Enter Movie Here',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: Colors.black,
                          width: 5
                      ),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                ),
                actions: <Widget>[
                  isSearching?
                  IconButton(
                    icon: Icon(Icons.cancel),
                    color: Colors.black,
                    onPressed: (){
                      setState(() {
                        this.isSearching = false;
                        // if(this.cusIcon.icon == Icons.search){
                        //   this.cusIcon = Icon(Icons.cancel);
                        //   this.cusSearchBar = TextField(
                        //     textInputAction: TextInputAction.go,
                        //     style: TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 16.0
                        //     ),
                        //   );
                        // }
                        // else{
                        //   this.cusIcon = Icon(Icons.search);
                        //   this.cusSearchBar = Center(child: Text("AppBar",style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),));
                        // }
                      });
                    },
                  ): IconButton(
                    icon: cusIcon,
                    color: Colors.black,
                    onPressed: (){
                      setState(() {
                        this.isSearching = true;
                        // if(this.cusIcon.icon == Icons.search){
                        //   this.cusIcon = Icon(Icons.cancel);
                        //   this.cusSearchBar = TextField(
                        //     textInputAction: TextInputAction.go,
                        //     style: TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 16.0
                        //     ),
                        //   );
                        // }
                        // else{
                        //   this.cusIcon = Icon(Icons.search);
                        //   this.cusSearchBar = Center(child: Text("AppBar",style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),));
                        // }
                      });
                    },
                  ),
                ],

                backgroundColor: Colors.amber,
                toolbarHeight: 80.0,
              ),


              body: TabBarView(
                children: <Widget>[
                  MovieListTile(),
                  //MovieList(),
                ],
              )
          ),
        )
    );
  }

}