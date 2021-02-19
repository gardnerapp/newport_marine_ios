import 'package:dilibro_boat/calender/has_appointments.dart';
import 'package:flutter/material.dart';

class Calender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ternary if data //push to online today
    return Scaffold(
      appBar: AppBar(
        title: Text("My Appointments"),
        elevation: 16.0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: HasAppointments(),
    );
  }
}
