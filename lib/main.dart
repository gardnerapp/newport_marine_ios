
import 'package:dilibro_boat/appointments/available_appointment_page_view.dart';
import 'package:dilibro_boat/authentication_pages/auth.dart';
import 'package:dilibro_boat/app_bar_styling.dart';
import 'package:dilibro_boat/forms/create_boat.dart';
import 'package:dilibro_boat/services/services_home.dart';
import 'package:flutter/material.dart';



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
          primaryColor: Colors.blueGrey[400],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
        );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Auth();
    //ServicesHome()
        // CreateBoat()
        //AppointmentPageView()
  }
}
