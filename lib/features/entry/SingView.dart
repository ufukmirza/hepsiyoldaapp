import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepsiyoldaapp/core/ListTheme.dart';
import 'package:hepsiyoldaapp/core/appBar.dart';
import 'package:provider/src/provider.dart';

class SignView extends StatelessWidget {
  String displayName = "";

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/images/account.png",
      height: mq.size.height / 4,
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("/loginScreen");
          String buttonName = "Login";
        },
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("/registerScreen");
          String buttonName = "Register";
        },
      ),
    );

    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 70),
          child: registerButton,
        ),
      ],
    );

    display() {
      if (displayName != null)
        return Text(
          "Welcome back $displayName!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        );
      else
        return Text(
          "Welcome!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        );
    }

    return Scaffold(
      // appBar: AppBar(
      //     leading: DayNightSwitcher(
      //         isDarkModeEnabled:
      //             context.watch<ListTheme>().isDark == true ? true : false,
      //         onStateChanged: (isDarkModeEnabled) {
      //
      //           context.read<ListTheme>().change();
      //
      //         })),
      appBar: appBar(context: context,),
      backgroundColor: Color(0xff8c52ff),
      body: Padding(
        padding: EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            logo,
            display(),
            buttons,
          ],
        ),
      ),
    );
  }
}
