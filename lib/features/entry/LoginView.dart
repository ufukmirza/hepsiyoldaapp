import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: TextButton(
      onPressed: () {
   Navigator.pushNamedAndRemoveUntil(context, "/menuScreen",(Route<dynamic> route) => false);
      }, child: Text("merhaba"),
    )));
  }
}
