import 'package:dilibro_boat/models/appointment.dart';
import 'package:flutter/material.dart';

class AppointmentPanel extends StatelessWidget {
  final Appointment appointment;

  const AppointmentPanel({Key key, this.appointment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 16.0,
        child: ListTile(
          title: Text(appointment.date, style: panelTitle(),),
          subtitle: Text(appointment.time, style: panelSubTitle(),),
          leading: Icon(Icons.calendar_today, color: Colors.black87, size: 45.0),
          onTap: () {},
        ));
  }
}

TextStyle panelTitle(){
  return TextStyle(
    color: Colors.black87,
    fontSize: 22.0
  );
}

TextStyle panelSubTitle(){
  return TextStyle(

      fontSize: 15.0
  );
}