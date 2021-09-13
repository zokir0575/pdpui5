import 'package:flutter/material.dart';
import 'package:pdpui5/pages/home_page.dart';
import 'package:pdpui5/pages/intro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:IntroPage(),
      routes: {
        HomePage.id: (context) => HomePage(),
         IntroPage.id: (context) => IntroPage()
    },
    );
  }
}
