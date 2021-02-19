import 'package:flutter/material.dart';

class HasAppointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        AppointmentCard(),
        AppointmentCard(),
        AppointmentCard(),
        AppointmentCard(),
      ],
    );
  }
}

class AppointmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("02/27 3:00PM"),
      subtitle: Text("Full Details"),
      onTap: (){

      },
    );
  }
}

