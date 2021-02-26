import 'package:dilibro_boat/api/appointment_request.dart';
import 'package:flutter/material.dart';


confirmationAppBar(BuildContext context, Function onPressed){
  AppointmentRequest req = AppointmentRequest();
  return AppBar(
    title: Text("Your Appointment"),
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.directions_boat),
          onPressed: onPressed),
    ],
  );
}
