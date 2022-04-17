
import 'package:flutter_application_1/Model/utils/databaseForLogin.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meenu_mega_test/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meenu_mega_test/My_encrption.dart';
import 'package:meenu_mega_test/utils/DatabaseForLogin.dart';

class CreateNewUser extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CreateNewUser>{
  List<Map<String,dynamic>> myList;
  List emailList=[];
  void getData()async{
    myList=await MyDatabase.instance.queryAll();
    for(int i=0;i<myList.length;i++)
    {
      emailList.add(myList[i]["email"].toString());
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  final TextEditingController _emailController=new TextEditingController();
  final TextEditingController _passController=new TextEditingController();
  final TextEditingController _ConfrimPassController=new TextEditingController();
  final TextEditingController _nameController=new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: () {
        // Write some code to control things, when user press Back navigation button in device navigationBar
        moveToLastScreen();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text('Register',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
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
        //appBar: AppBar(title: Text("Login UI"),),
          body:Form(
            key: _formKey,
            child: Align(
              alignment: Alignment.center,
              child: Center(
                child: ListView(
                  //shrinkWrap: true,
                  children: [
                    Container(
                        //padding: EdgeInsets.all(10.0),
                      child: Image.network("https://media.istockphoto.com/photos/button-on-computer-keyboard-picture-id1146311489?b=1&k=6&m=1146311489&s=170667a&w=0&h=GFacsiyaQMEfptGYNQXBKwePKsPzpnAX0dJRGYMfuy0=",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(

                                decoration: InputDecoration(
                                  hintText: "Username",
                                  // border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.black54),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                      BorderSide(color: Colors.black54)),
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  fillColor: Color(0xfff5f5f5),
                                  filled: true,
                                ),
                                validator: (value)
                                {
                                  if(value.isEmpty)
                                  {
                                    return "Please Enter Name Here";
                                  }
                                  return null;
                                },

                                controller: _nameController,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(

                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,

                                decoration: InputDecoration(
                                  hintText: "Email",
                                  // border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.black54),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                      BorderSide(color: Colors.black54)),
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  fillColor: Color(0xfff5f5f5),
                                  filled: true,
                                ),

                                //Validation..
                                validator: (value)
                                {
                                  if(value.isEmpty)
                                  {
                                    return "please enter some value";
                                  }
                                  if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[['
                                      r'0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                      .hasMatch(value)) {
                                    return "please return a valid email address";
                                  }
                                  if(emailList.toString().contains(_emailController.text))
                                  {
                                    return "email already exist";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 20.0,),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                obscureText: true,
                                controller: _passController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "password",
                                  // border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.black54),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                      BorderSide(color: Colors.black54)),
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  fillColor: Color(0xfff5f5f5),
                                  filled: true,
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                ),


                                validator: (value)
                                {
                                  if(value.isEmpty)
                                  {
                                    return "Password Required.";
                                  }
                                  if (!RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                      .hasMatch(value)) {
                                    return "please enter correct password";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            // SizedBox(height: 15.0,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(

                                controller: _ConfrimPassController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.black54),
                                  ),
                                  //  border: InputBorder.none,
                                  hintText: "Confirm password",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                      BorderSide(color: Colors.black54)),
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  fillColor: Color(0xfff5f5f5),
                                  filled: true,
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                ),

                                validator: (value)
                                {
                                  if(value.isEmpty)
                                  {
                                    return "please enter some value";
                                  }
                                  if(_ConfrimPassController.text!=_passController.text)
                                  {
                                    return "password do not match";
                                  }
                                  if (!RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                      .hasMatch(value)) {
                                    return "please enter correct password";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 20.0,),

                          ],
                        )
                    ),

                    SizedBox(
                      width: 40.0,
                    ),
                    Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              color: HexColor("#ffc905"),
                              onPressed: ()async
                              {
                                var PlainText = _passController.text;
                                setState(() {
                                   var encryptedText = MyEncryptionDecryption.decryptAES(PlainText);
                                });
                                if(_formKey.currentState.validate())
                                {
                                  await MyDatabase.instance.insert({
                                    // MyDatabase.columnId:customerId.text,
                                    MyDatabase.columnName: _nameController.text.toString(),
                                    MyDatabase.columnEmail: _emailController.text.toString(),
                                    MyDatabase.columnPass: _passController.text.toString(),
                                    MyDatabase.columnCPass: _ConfrimPassController.text.toString(),
                                  });
                                  Fluttertoast.showToast(msg: "User Successfully Registered",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);

                                  //Move to previous screen....
                                  moveToLastScreen();
                                }
                              },
                              // color: Colors.yellow,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
}