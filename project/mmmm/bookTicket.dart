import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:meenu_mega_test/Models/note.dart';
import 'package:meenu_mega_test/MovieListScreen.dart';
import 'package:meenu_mega_test/icons.dart';
import 'package:meenu_mega_test/utils/Database_Helper.dart';


class BookTicket extends StatefulWidget {
  const BookTicket({Key key}) : super(key: key);

  @override
  _BookTicketState createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _aadharController = TextEditingController();
  TextEditingController _telePhoneNoController = TextEditingController();
  TextEditingController _confrimPasswordController = TextEditingController();
  //NoteDetailState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.headline6;




    return WillPopScope(

        onWillPop: () {
          // Write some code to control things, when user press Back navigation button in device navigationBar
          moveToLastScreen();
        },

        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text('Proceed to Checkout',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
            leading: IconButton(icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }
            ),
          ),

          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: _nameController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Name Text Field');
                      //updateDescription();
                    },
                    decoration: InputDecoration(
                        labelText: 'Customer Name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: _emailController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Email Text Field');
                      //updateDescription();
                    },
                    decoration: InputDecoration(
                        labelText: 'Customer Email ID',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: _passwordController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Password Text Field');
                      //updateDescription();
                    },
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: _confrimPasswordController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Confrim Password Text Field');
                      // updateDescription();
                    },
                    decoration: InputDecoration(
                        labelText: 'Movie Title',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: _aadharController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Aadhar Text Field');
                      //updateDescription();
                    },
                    decoration: InputDecoration(
                        labelText: 'Contact No',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: _telePhoneNoController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in TelePhone No. Text Field');
                      //updateDescription();
                    },
                    decoration: InputDecoration(
                        labelText: 'No. of tickets required',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: _telePhoneNoController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in TelePhone No. Text Field');
                      //updateDescription();
                    },
                    decoration: InputDecoration(
                        labelText: 'Date/time slot',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        )
                    ),
                  ),
                ),
                // Fourth Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Container(
                    height: 30,
                    child: RaisedButton(
                      // color: HexColor("#ffc905"),
                      // textColor: Theme.of(context).primaryColorLight,
                      color: HexColor("#ffc905"),
                      textColor: Colors.white,
                      child: Text('Proceed To Checkout',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                      onPressed: () {
                        setState(() {
                          debugPrint("Save button clicked");
                          //_save();
                        }
                        );
                        if (_emailController.text.toString().isNotEmpty && _passwordController.text.toString().isNotEmpty)
                        {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ticket Booked Succesfully')));
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('give vaild details')));
                        }

                      },
                    ),
                  ),
                ),

              ],
            ),
          ),

        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

}
