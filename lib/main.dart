
import 'package:dilibro_boat/authentication_pages/auth.dart';
import 'package:dilibro_boat/app_bar_styling.dart';
import 'package:dilibro_boat/forms/create_boat.dart';
import 'package:dilibro_boat/models/boat.dart';
import 'package:dilibro_boat/services/full_detail/full_detail.dart';
import 'package:dilibro_boat/services/igl/igl.dart';
import 'package:dilibro_boat/services/services_home.dart';
import 'package:dilibro_boat/services/wash/wash_confirmation.dart';


import 'package:dilibro_boat/services/wash/wash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/user.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //WashConfirmation();
     ServicesHome(
      user: User(
          name: "Corey",
          phone: "5555559898",
          email: "corey@example.com",
          id: 0,
          boat: Boat("hog", 22, "location")),
    );
    //IGLHome();
    //  FullDetail();

    //ThankYou();
    /* WashPage(
      user: User(
          name: "Corey",
          phone: "5555559898",
          email: "corey@example.com",
          id: 0,
          boat: Boat("hog", 22, "location")),
    );*/

    //Auth();
   //
   // CreateBoat();
  }
}
