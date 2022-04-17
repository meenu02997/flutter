// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:intl/intl.dart';
// import 'package:mega_test/Models/note.dart';
// import 'package:mega_test/MovieListScreen.dart';
// import 'package:mega_test/icons.dart';
// import 'package:mega_test/utils/Database_Helper.dart';
//
//
// class NoteDetail extends StatefulWidget {
//
//   // final String appBarTitle;
//   final Note note;
//   //
//   NoteDetail(this. note);
//
//
//   @override
//   State<StatefulWidget> createState() {
//
//     // return NoteDetailState(this.note, this.appBarTitle);
//     return NoteDetailState(this.note);
//   }
// }
//
// class NoteDetailState extends State<NoteDetail> {
//
//   // static var _priorities = ['High', 'Low'];
//   //
//   DatabaseHelper helper = DatabaseHelper();
//   //
//   // String appBarTitle;
//   Note note;
//
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _aadharController = TextEditingController();
//   TextEditingController _telePhoneNoController = TextEditingController();
//   TextEditingController _confrimPasswordController = TextEditingController();
//   NoteDetailState(this.note);
//
//   @override
//   Widget build(BuildContext context) {
//
//     TextStyle textStyle = Theme.of(context).textTheme.headline6;
//
//     titleController.text = note.title;
//     descriptionController.text = note.description;
//     _nameController.text = note.name;
//     _telePhoneNoController.text = note.telephone_no;
//     _emailController.text = note.email;
//     _passwordController.text = note.password;
//     _aadharController.text = note.Aadhar;
//     // _confrimPasswordController.text = note.
//     // TextEditingController  _nameController =TextEditingController();
//     // TextEditingController  _telePhoneNoController =TextEditingController();
//     // TextEditingController  _emailController =TextEditingController();
//     // TextEditingController  _passwordController =TextEditingController();
//     // TextEditingController  _aadharController =TextEditingController();
//     // TextEditingController  _mmmnameController =TextEditingController();
//
//
//
//     return WillPopScope(
//
//         onWillPop: () {
//           // Write some code to control things, when user press Back navigation button in device navigationBar
//           moveToLastScreen();
//         },
//
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.amber,
//             title: Text('Register',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
//             leading: IconButton(icon: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             ),
//                 onPressed: () {
//                   // Write some code to control things, when user press back button in AppBar
//                   moveToLastScreen();
//                 }
//             ),
//           ),
//           bottomNavigationBar: SizedBox(
//             height: MediaQuery.of(context).size.height*0.09,
//             child: Padding(
//               padding: EdgeInsets.all(2.0),
//               child: RaisedButton(
//                 onPressed: () {
//                   setState(() {
//                     debugPrint("register button clicked");
//                     _save();
//                   }
//                   );
//                   if (_emailController.text.toString().isNotEmpty && _passwordController.text.toString().isNotEmpty)
//                   {
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User registered Succesfully')));
//                   }
//                   else{
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('give vaild details')));
//                   }
//
//                 },
//                 color: HexColor("#ffc905"),
//                 textColor: Colors.white,
//                 child: Text('Register',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
//               ),
//             ),
//           ),
//
//           body: Padding(
//             padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
//             child: ListView(
//               children: <Widget>[
//
//                 Padding(
//                   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
//                   child: TextField(
//                     controller: titleController,
//                     style: textStyle,
//                     onChanged: (value) {
//                       debugPrint('Something changed in Name Text Field');
//                       updateTitle();
//                     },
//                     decoration: InputDecoration(
//                         labelText: 'Name',
//                         labelStyle: textStyle,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0)
//                         )
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
//                   child: TextField(
//                     controller: _emailController,
//                     style: textStyle,
//                     onChanged: (value) {
//                       debugPrint('Something changed in Email Text Field');
//                       updateEmail();
//                     },
//                     decoration: InputDecoration(
//                         labelText: 'Email ID',
//                         labelStyle: textStyle,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0)
//                         )
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
//                   child: TextField(
//                     controller: _passwordController,
//                     style: textStyle,
//                     onChanged: (value) {
//                       debugPrint('Something changed in Password Text Field');
//                       updatePaasword();
//                     },
//                     decoration: InputDecoration(
//                         labelText: 'Password',
//                         labelStyle: textStyle,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0)
//                         )
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
//                   child: TextField(
//                     controller: _confrimPasswordController,
//                     style: textStyle,
//                     onChanged: (value) {
//                       debugPrint('Something changed in Confrim Password Text Field');
//                       updatePaasword();
//                     },
//                     decoration: InputDecoration(
//                         labelText: 'Confrim Password',
//                         labelStyle: textStyle,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0)
//                         )
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
//                   child: TextField(
//                     controller: descriptionController,
//                     style: textStyle,
//                     onChanged: (value) {
//                       debugPrint('Something changed in Aadhar Text Field');
//                       updateDescription();
//                     },
//                     decoration: InputDecoration(
//                         labelText: 'Aadhar',
//                         labelStyle: textStyle,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0)
//                         )
//                     ),
//                   ),
//                 ),
//
//                 Padding(
//                   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
//                   child: TextField(
//                     controller: _telePhoneNoController,
//                     style: textStyle,
//                     onChanged: (value) {
//                       debugPrint('Something changed in TelePhone No. Text Field');
//                       updateDescription();
//                     },
//                     decoration: InputDecoration(
//                         labelText: 'TelePhone No.',
//                         labelStyle: textStyle,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5.0)
//                         )
//                     ),
//                   ),
//                 ),
//                 // Fourth Element
//                 Padding(
//                   padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
//                   child: Container(
//                     height: 30,
//                     child: RaisedButton(
//                       color: HexColor("#ffc905"),
//                       textColor: Theme.of(context).primaryColorLight,
//                       child: Text(
//                         'Save',
//                         textScaleFactor: 1.5,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           debugPrint("Save button clicked");
//                           //_save();
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ));
//   }
//
//   void moveToLastScreen() {
//     Navigator.pop(context, true);
//   }
//
//   // Convert the String priority in the form of integer before saving it to Database
//
//
//   // Update the title of Note object
//   void updateTitle(){
//     note.title = titleController.text;
//   }
//
//   // Update the description of Note object
//   void updateDescription() {
//     note.description = descriptionController.text;
//   }
//   void updateName() {
//     note.name = _nameController.text;
//   }
//
//   void updateEmail() {
//     note.email = _emailController.text;
//   }
//
//   void updatePaasword() {
//     note.password = _passwordController.text;
//   }
//
//
//
//   // Save data to database
//   void _save() async {
//
//     moveToLastScreen();
//
//     note.date = DateFormat.yMMMd().format(DateTime.now());
//     int result;
//     result = await helper.insertNote(note);
//
//     if (result != 0) {  // Success
//       _showAlertDialog('Status', 'user Created Successfully');
//     } else {  // Failure
//       _showAlertDialog('Status', 'Problem Saving Note');
//     }
//
//   }
//
//   /*void _delete() async {
//
//     moveToLastScreen();
//
//     // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
//     // the detail page by pressing the FAB of NoteList page.
//     if (note.id == null) {
//       _showAlertDialog('Status', 'No Note was deleted');
//       return;
//     }
//
//     // Case 2: User is trying to delete the old note that already has a valid ID.
//     int result = await helper.deleteNote(note.id);
//     if (result != 0) {
//       _showAlertDialog('Status', 'Note Deleted Successfully');
//     } else {
//       _showAlertDialog('Status', 'Error Occured while Deleting Note');
//     }
//   }*/
//
//   void _showAlertDialog(String title, String message) {
//
//     AlertDialog alertDialog = AlertDialog(
//       title: Text(title),
//       content: Text(message),
//     );
//     showDialog(
//         context: context,
//         builder: (_) => alertDialog
//     );
//   }
//
// }