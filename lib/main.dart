import 'package:flutter/material.dart';
import 'package:mad2_app/about_page.dart';
import 'package:mad2_app/home_page.dart';
import 'package:mad2_app/nav.dart';
import 'package:mad2_app/holiday_page.dart';
import 'package:mad2_app/login_page.dart';

void main() {
  runApp(const MainApp());
}


class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  State<MainApp> createState() => _MainAppState();
}
class _MainAppState extends State<MainApp> {
  bool _signedIn = false;
  void setSignedIn(bool signedIn) {
    setState(() {
      _signedIn = signedIn;
    });
  }
  @override Widget build(BuildContext context) {
    print(_signedIn);
    return MaterialApp(
      home: _signedIn
          ? Nav(setSignedIn: setSignedIn, title: 'Holidays',)
          : LoginPage(setSignedIn: setSignedIn),
    );
  }
}

