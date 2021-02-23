import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import 'package:flutter/material.dart';

// Displays the Thank You Message for the Service :)

class ThankYou extends StatelessWidget {
  final User user;
  final DateTime date;
  final TimeOfDay time;
  final String serviceName;

  const ThankYou({Key key, this.user, this.date, this.time, this.serviceName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        instructionText("Thank You ${user.name}!\n"),
        instructionText(
            "The ${user.boat.name} will be $serviceName on ${date.month}/${date.day} @ ${time.hour}:${time.minute}\n"),
        instructionText(
            "Confirm and book your appointment by tapping the boat in the top right corner\n"),
      ],
    );
  }
}
