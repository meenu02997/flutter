import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meenu_mega_test/Models/note.dart';
import 'package:meenu_mega_test/MovieListScreen.dart';
import 'package:meenu_mega_test/RegisterUser_Screen.dart';
import 'package:meenu_mega_test/utils/DatabaseForLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'My_encrption.dart';

SharedPreferences alreadyVisited;
final TextEditingController _emailcontroller = TextEditingController();
final TextEditingController _passcontroller = TextEditingController();

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  //const MainScreen({Key? key}) : super(key: key);
  Note note;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> myList;
  List emailList = [];
  List passList = [];
  void getData() async {
    myList = await MyDatabase.instance.queryAll();
    for (int i = 0; i < myList.length; i++) {
      emailList.add(myList[i]["email"].toString());
      passList.add(myList[i]["password"].toString());
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getData();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIJvtGOkBvH8EgN-qd_77VtxHudq247GESL4Hykc30n6dAVijp-Ys_lCOJ6moGLDpQF_g&usqp=CAU"
                //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh3k2vJR9vjemvgtSewQ1mQdfdjQqF9MTmty_rJAT7HqBulA34QaMEBjG9inm2yakLlS4&usqp=CAU"
                ,
              ),
              fit: BoxFit.cover,
              //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              SizedBox(
                height: 50.0,
              ),

              TextFormField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                  border: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black, width: 5),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                validator: Validators.compose([
                  Validators.required('email required'),
                  Validators.email('invalid email')
                ]),
                keyboardType: TextInputType.emailAddress,
                autofillHints: [AutofillHints.email],
                obscureText: false,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _passcontroller,
                decoration: InputDecoration(
                    hintText: 'Enter password',
                    hintStyle: TextStyle(color: Colors.black, fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {},
                    )),
                obscureText: true,
                validator: (value) {
                  if (value == null && value.isEmpty) {
                    return "password required";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 50,
                      // ignore: deprecated_member_use
                      child: FlatButton(
                          color: Colors.black,
                          //color: HexColor("#ffc905"),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            if (_emailcontroller.text.toString().isNotEmpty &&
                                _passcontroller.text.toString().isNotEmpty) {
                              if (_formKey.currentState.validate()) {
                                if (emailList
                                        .toString()
                                        .contains(_emailcontroller.text) &&
                                    passList.toString().contains(
                                        MyEncryptionDecryption.encryptAES(
                                                _passcontroller.text)
                                            .toString())) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MovieListScreen()));
                                  Fluttertoast.showToast(
                                      msg: " successfully login",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "User Not Exist",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              }
                              _emailcontroller.clear();
                              _passcontroller.clear();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Enter valid details')));
                            }
                          }),
                    ),
                  ],
                ),
              ),
              //SizedBox(height:25.0),
              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Forgot your password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Don't have an account?",
                        //textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: InkWell(
                          child: Text(
                            "Sign up",
                            //textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                                //color: HexColor("#ffc905")
                                ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CreateNewUser()));
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ))),
    ));
  }
}
