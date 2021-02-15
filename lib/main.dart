
import 'package:dilibro_boat/appointments/book_appointment.dart';
import 'package:dilibro_boat/authentication_pages/auth.dart';
import 'package:dilibro_boat/app_bar_styling.dart';
import 'package:dilibro_boat/forms/create_boat.dart';
import 'package:dilibro_boat/services/services_home.dart';
import 'package:dilibro_boat/services/thank_you.dart';

import 'package:dilibro_boat/services/wash/wash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



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
    return //ThankYou();
     // WashPage();

   Auth();
   // ServicesHome();
   // CreateBoat();
  }
}
