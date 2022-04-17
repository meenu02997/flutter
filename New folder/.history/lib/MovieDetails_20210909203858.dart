import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetails extends StatefulWidget {
  String posterpath;
  String original_title;
  // ignore: non_constant_identifier_names
  String release_date;
  String overview;
  // ignore: non_constant_identifier_names
  String Contentt;
  MovieDetails(
      // ignore: non_constant_identifier_names
      {this.posterpath,
      this.original_title,
      this.release_date,
      this.overview,
      this.Contentt});

  //final String title;
  @override
  _MovieDetailsState createState() => _MovieDetailsState(
        posterpath: posterpath,
        original_title: original_title,
        overview: overview,
        release_date: release_date,
        Contentt: Contentt,
      );
}

class _MovieDetailsState extends State<MovieDetails> {
  String posterpath;
  String original_title;
  // ignore: non_constant_identifier_names
  String release_date;
  String overview;

  // ignore: non_constant_identifier_names
  var Contentt;
  _MovieDetailsState(
      {this.posterpath,
      this.original_title,
      this.overview,
      this.release_date,
      // ignore: non_constant_identifier_names
      this.Contentt});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              title: Text(
                "${original_title}",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.amber,
              toolbarHeight: 80.0,
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          //height: 50*SizeConfig,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                          ),
                        ),
                      ),
                      Positioned(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            //height: 50*SizeConfig,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.network(
                              posterpath,
                              fit: BoxFit.fill,
                            ),
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.3,
                        child: Container(
                          margin: EdgeInsets.all(3),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: Colors.lime,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 7.0,
                              ),
                              Text(
                                original_title,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: overview,
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54)),
                              ])),
                              SizedBox(
                                height: 7.0,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: Contentt,
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54)),
                              ])),
                              SizedBox(
                                height: 7.0,
                              ),
                              Text(
                                release_date,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(16.0),
                                  primary: Colors.white,
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  launch(
                                      'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                                },
                                child: const Text('ReadMore...'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('Contentt', Contentt));
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 7.0,
      width: 7.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
