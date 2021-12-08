
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepsiyoldaapp/features/entry/LoginView.dart';
import 'package:hepsiyoldaapp/features/entry/RegisterView.dart';
import 'package:hepsiyoldaapp/features/entry/SingView.dart';
import 'package:hepsiyoldaapp/features/tabview/tabViewClass.dart';

class RouterDart {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => SignView( ));
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginView());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case menuScreen:
        return MaterialPageRoute(builder: (_) => tabViewClass());
      case addProductScreen:
        return MaterialPageRoute(builder: (_) => tabViewClass());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Ters giden birşeyler oldu'),
            ),
          ),
        );
    }
  }
}

const String homeRoute = '/';
const String loginScreen = '/loginScreen';
const String registerScreen = '/registerScreen';
const String menuScreen = '/menuScreen';
const String addProductScreen="/addProductScreen";