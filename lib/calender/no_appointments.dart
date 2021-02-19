import 'package:flutter/material.dart';

class NoAppointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
          child: Text("You Have No Upcoming Appointments :(",
            style: TextStyle( fontSize: 30.0), textAlign: TextAlign.center,)
      ),);
  }
}
