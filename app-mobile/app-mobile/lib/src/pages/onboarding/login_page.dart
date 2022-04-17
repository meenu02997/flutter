import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilunch/src/localization/app_translation.dart';
import 'package:ilunch/src/pages/home/dashboard.dart';
import 'package:ilunch/src/services/auth_api_client.dart';
import 'package:ilunch/src/utils/color_converter_utils.dart';
import 'package:ilunch/src/utils/color_utils.dart';
import 'package:ilunch/src/utils/helper_function.dart';
import 'package:ilunch/src/widgets/base_widget.dart';
import 'package:ilunch/src/widgets/rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../utils/color_converter_utils.dart';
import '../../utils/color_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _isError = false;
  bool isEmailtap = false;
  bool isPasswordtap = false;
  bool isValidPassword = true;
  bool isValidEmail = true;
  String password = '';
  String email = '';
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor(loginBackground),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        backgroundColor: HexColor(loginBackground),
        body: ModalProgressHUD(
            dismissible: false,
            opacity: 0,
            inAsyncCall: _isLoading,
            child: BaseWidget(
                backIcon: true,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        AppTranslations.of(context).text('login_header'),
                        style: TextStyle(
                            color: HexColor(textColor),
                            fontSize: 20,
                            fontFamily: 'young'),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        AppTranslations.of(context).text('email_address'),
                        style: TextStyle(
                            color: HexColor(textColor),
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            fontFamily: 'averta_semibold'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _showEmailTextField(),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        AppTranslations.of(context).text('password'),
                        style: TextStyle(
                            color: HexColor(textColor),
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            fontFamily: 'averta_semibold'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _showPasswordTextField(),
                    if (_isError) _showError(),
                    SizedBox(
                      height: 28,
                    ),
                    _showLoginButton(),
                    SizedBox(
                      height: 10,
                    ),
                    //_showForgotPassword()
                  ],
                ))));
  }

  Widget _showEmailTextField() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: HexColor(isEmailtap ? appGreen : "#d9d9d9"),
              width: 1,
              style: BorderStyle.solid),
          bottom: BorderSide(
              color: HexColor(isEmailtap ? appGreen : "#d9d9d9"),
              width: 1,
              style: BorderStyle.solid),
        ),
      ),
      child: TextFormField(
        onTap: () => {
          setState(() {
            isEmailtap = true;
            isPasswordtap = false;
          })
        },
        controller: emailController,
        onChanged: ((value) {
          setState(() {
            email = value.trim();
            _isError = false;
          });
        }),
        maxLength: 150,
        keyboardType: TextInputType.emailAddress,
        // Use email input type for emails.
        decoration: new InputDecoration(
          counter: SizedBox.shrink(),
          contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8),
          hintText: AppTranslations.of(context).text('enter_email_address'),
          hintStyle: TextStyle(
              fontFamily: 'averta_regular',
              fontSize: 15,
              color: HexColor('#7e7e7e')),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _showPasswordTextField() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: HexColor(isPasswordtap ? appGreen : "#d9d9d9"),
              width: 1,
              style: BorderStyle.solid),
          bottom: BorderSide(
              color: HexColor(isPasswordtap ? appGreen : "#d9d9d9"),
              width: 1,
              style: BorderStyle.solid),
        ),
      ),
      child: TextFormField(
        maxLength: 20,
        onTap: () => {
          setState(() {
            isPasswordtap = true;
            isEmailtap = false;
          })
        },
        controller: passwordController,
        onChanged: ((value) {
          setState(() {
            password = value.trim();
            _isError = false;
          });
        }),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        // Use email input type for emails.
        decoration: new InputDecoration(
          counter: SizedBox.shrink(),
          contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8),
          hintText: AppTranslations.of(context).text('enter_your_password'),
          hintStyle: TextStyle(
              fontFamily: 'averta_regular',
              fontSize: 15,
              color: HexColor('#7e7e7e')),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _showLoginButton() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 16, right: 16),
      child: RoundedButton(
        text: AppTranslations.of(context).text('login_in'),
        radius: 30,
        kind: RoundedButtonKind.filled,
        contrastColor: Colors.white,
        disable: !(hasValidPassword(password) && hasValidEmail(email)),
        color: HexColor(appGreen),
        onPressed: () => {_login()},
      ),
    );
  }

  Widget _showForgotPassword() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Text(
        AppTranslations.of(context).text('forgot_your_password'),
        style: TextStyle(
            color: HexColor(appGreen),
            fontSize: 14,
            fontFamily: 'averta_regular'),
      ),
    );
  }

  bool hasValidPassword(String password) {
    setState(() {
      isValidPassword = password.length >= 3;
    });
    return password.length >= 3;
  }

  bool hasValidEmail(String email) {
    setState(() {
      isValidEmail = email.contains(RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
          )) &&
          email.length > 0;
    });

    return email.contains(RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ));
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      isPasswordtap = false;
      isEmailtap = false;
    });
    await AuthApiClient().login({
      "main_form_security_login[email]": email,
      "main_form_security_login[plainPassword]": password,
    }).then((response) async {
      print(response['token']);
      print(response['identifier']);
      await HelperFunction.saveTokenSharedPreference(response["token"]);
      await HelperFunction.saveUserIdSharedPreference(response["identifier"]);
      setState(() {
        _isLoading = false;
        Navigator.popUntil(context, ModalRoute.withName('/'));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashBoardPage()),
        );
      });
    }).catchError((error) {
      print(error);
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    });
  }

  Widget _showError() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/error.svg',
                width: 25,
                height: 25,
                color: HexColor('#e71d32'),
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                AppTranslations.of(context).text('incorrect_login'),
                style: TextStyle(
                  color: HexColor('#e71d32'),
                  fontSize: 11,
                  fontFamily: 'averta-regular',
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
