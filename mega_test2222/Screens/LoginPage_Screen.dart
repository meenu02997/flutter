import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mega_test2222/Model/ModelForLogin.dart';
import 'package:mega_test2222/Screens/ProductList_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';



final TextEditingController _emailcontroller = TextEditingController();
final TextEditingController _passcontroller = TextEditingController();

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Dio dio = new Dio();
  LoginApiModel loginObj = LoginApiModel();
  final String pathUrl = "https://demo.webkul.com/mobikul/customer/login";

  Future<LoginApiModel> LoginApi(String encoded) async{
    SharedPreferences preferences=await SharedPreferences.getInstance();

    preferences.setString("loginKey", encoded);
    print(encoded);
    Response response = await dio.post(Uri.encodeFull(pathUrl), options: Options(headers: {"Content-Type":"text/plain",
        "charset":"UTF-8",
        "Authorization" : "Basic bGl2ZVNlY3JldEtleTpsaXZlU2VjcmV0S2V5",
        "lang":"en_US",
        "Login":"$encoded",}
    ));
    if(response.statusCode ==200){
      print(' hello meenu');
      loginObj=LoginApiModel.fromJson(response.data);
      print(response.statusCode);
      print(response.data.toString());
    }
    return loginObj;
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();
    //postData();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:Form(
          key: _formKey,
          child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAVGatcWzndNQSbeVmubwEBKF0oIuU6w-nrQ&usqp=CAU",),
                  fit: BoxFit.cover,
                ),
              ),
              child:Center(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
                      SizedBox(height: 50.0,),

                      TextFormField(
                        controller: _emailcontroller,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Enter email',
                          hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                          border: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black,width: 5),
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),
                        validator:Validators.compose(
                            [
                              Validators.required('email required'),
                              Validators.email('invalid email')
                            ]
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: [AutofillHints.email],
                        obscureText: false,
                      ),
                      SizedBox(height: 20.0,),
                      TextFormField(
                        controller: _passcontroller,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Enter password',
                            hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: (){
                              },
                            )
                        ),
                        obscureText: true,
                        validator: (value) {

                          if(value == null && value.isEmpty){
                            return "password required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40.0,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 50,
                              child: FlatButton(
                                  color: Colors.black,
                                  //color: HexColor("#ffc905"),
                                  child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                  onPressed: () async{
                                    //getData();
                                    //await LoginApi(encoded);
                                    if (_emailcontroller.text.toString().isNotEmpty && _passcontroller.text.toString().isNotEmpty) {
                                      if (_formKey.currentState.validate()) {
                                        Map map = <String, String>{"login": "${_emailcontroller.text}", "pwd": "${_passcontroller.text}"};
                                        //Map map = <String, String>{"login": "meenu.singh657@webkul.com", "pwd": "Meenu@321"};
                                        String credentials = json.encode(map).toString();
                                        Codec<String, String> stringToBase64 = utf8.fuse(base64);
                                        String encoded = stringToBase64.encode(credentials);
                                        print(encoded);
                                        await LoginApi(encoded);
                                        if(loginObj.message=="Login successfully.")
                                        {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductListScreen()));
                                        }
                                          Fluttertoast.showToast(msg: loginObj.message,
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                      }
                                      _emailcontroller.clear();
                                      _passcontroller.clear();
                                    }else{
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter valid details')));
                                    }
                                  }
                              ),
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
                          Expanded(child: Text(
                            'Forgot your password?',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,),
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
                                        color: Colors.red
                                      //color: HexColor("#ffc905")
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
              )
          ),
        )
    );
  }

//   getData() async{
// Map map = <String, String>{"login": "${_emailcontroller.text}", "pwd": "${_passcontroller.text}"};
// //Map map = <String, String>{"login": "meenu.singh657@webkul.com", "pwd": "Meenu@321"};
// String credentials = json.encode(map).toString();
// Codec<String, String> stringToBase64 = utf8.fuse(base64);
// String encoded = stringToBase64.encode(credentials);
// print(encoded);
// await LoginApi(encoded);
//   }

}
