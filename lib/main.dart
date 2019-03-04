import 'package:flutter/material.dart';
import './pages/home/home.dart';

void main()=>runApp(Dpool());

class Dpool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dpool',
      theme: ThemeData(
        // primaryColor: Color(0xff76c1b3),
        // canvasColor: Color(0xff247ba0),
        scaffoldBackgroundColor: Color(0xfff9f9f9),
      ),
      home: Home(),
    );
  }
}