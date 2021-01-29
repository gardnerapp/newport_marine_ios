import 'package:dilibro_boat/models/appointment.dart';
import 'package:flutter/material.dart';
import 'appointment_panel.dart';

class AvailableAppointmentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
            padding: EdgeInsets.all(5.0),
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 15.0,),
              Text(
                "3/15 - 3/22",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black87, fontSize: 25.0),
              ),
              Text(
                "Available Appointments:",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black87, fontSize: 25.0),
              ),
              SizedBox(height: 15.0,),
              AppointmentPanel(appointment: Appointment(date:"Monday 15th", time: "12:00pm")),
              AppointmentPanel(appointment: Appointment(date:"Monday 15th", time: "12:00pm")),
              AppointmentPanel(appointment: Appointment(date:"Monday 15th", time: "12:00pm")),
              AppointmentPanel(appointment: Appointment(date:"Monday 15th", time: "12:00pm")),
              AppointmentPanel(appointment: Appointment(date:"Monday 15th", time: "12:00pm")),
              AppointmentPanel(appointment: Appointment(date:"Monday 15th", time: "12:00pm")),
              AppointmentPanel(appointment: Appointment(date:"Monday 15th", time: "12:00pm")),
              AppointmentPanel(appointment: Appointment(date:"Monday 15th", time: "12:00pm")),
              AppointmentPanel(appointment: Appointment(date:"Monday 15th", time: "12:00pm")),
              AppointmentPanel(appointment: Appointment(date:"Monday 15th", time: "12:00pm")),
            ],
          );
  }
}

