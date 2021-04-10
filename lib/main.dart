
import 'package:dilibro_boat/authentication_pages/auth.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Newport Marine Detailing',
      theme: ThemeData(
        primaryColorLight: Colors.greenAccent,
        appBarTheme: AppBarTheme(
          elevation: 16.0,
        ),
        primaryColor: Colors.greenAccent[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),

    );
  }
}
//1112223333
//apple101
// TODO first update => allow login if no boat reroute to create boat when clicking on services
// && edit boat page
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Auth();

  }
}
