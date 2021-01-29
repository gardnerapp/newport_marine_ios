
import 'package:dilibro_boat/appointments/available_appointment_page_view.dart';
import 'package:dilibro_boat/custom_scaffold.dart';
import 'package:dilibro_boat/forms/create_boat.dart';
import 'package:dilibro_boat/services/services_home.dart';
import 'package:flutter/material.dart';

//todo //HSVColor
// // //#323966 heex colo

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
        home: CustomScaffold(
          widget: Home(),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: ServicesHome()
        // CreateBoat()
        //AppointmentPageView()
        );
  }
}
