import 'package:core/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/util/view/custom_button.dart';

import '../../session.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    final session = Session();

    final emailField = TextField(
      onChanged: (text) {
        email = text;
      },
      obscureText: false,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.7),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
    final passwordField = TextField(
      onChanged: (text) {
        password = text;
      },
      obscureText: true,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.7),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
    final loginButton = CustomButton(
      text: "Login",
      fontSize: 18.0,
      matchParent: true,
      onPressed: () {
        session.setStringSession(SESSION_USER_NAME, email);
        session.setBooleanSession(SESSION_IS_LOGIN, true);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      },
    );

    final registerButton = CustomButton(
      text: "Register",
      elevation: 0.0,
      color: Colors.transparent,
      textColor: Colors.black,
      borderColor: Colors.black,
      fontSize: 18.0,
      matchParent: true,
      onPressed: () {

      },
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
//        resizeToAvoidBottomPadding: false,
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 100.0, left: 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/images/logo.png"),
                ),
                Text(
                  "Your personal",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Beauty Assistant",
                  style: TextStyle(color: Colors.white, fontSize: 21.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Text(
                      "Forgot Pasword?",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                ),
                SizedBox(height: 35.0),
                loginButton,
                SizedBox(height: 15.0),
                registerButton
              ],
            ),
          )
        ],
      ),
    ));
  }
}
