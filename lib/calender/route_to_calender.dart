import 'dart:convert';
import 'package:dilibro_boat/api/appointment_request.dart';
import 'package:dilibro_boat/authentication_pages/login_error.dart';
import 'package:dilibro_boat/calender/calender.dart';
import 'package:dilibro_boat/calender/has_appointments.dart';
import 'package:dilibro_boat/calender/no_appointments.dart';
import 'package:flutter/material.dart';

class RouteCalender extends StatelessWidget {
  final int userId;
  final String token;

  const RouteCalender({Key key, this.userId, this.token}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppointmentRequest appointmentRequest = AppointmentRequest();
    return IconButton(
        icon: Icon(Icons.calendar_today),
        onPressed: () async {
          var req = await appointmentRequest.getUserAppointments(userId, token);
          if(req.statusCode == 202){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Calender(
                          child: HasAppointments(
                            data: jsonDecode(req.body),
                          ),
                        )));
          } else if (req.statusCode == 204) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Calender(
                          child: NoAppointments(),
                        )));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginError()));
          }
        });
  }
}
