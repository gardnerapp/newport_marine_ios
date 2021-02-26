import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/confirmation/confirmation_appbar.dart';
import 'package:dilibro_boat/services/confirmation/confirmation_card.dart';
import 'package:dilibro_boat/services/confirmation/summary.dart';
import 'package:dilibro_boat/services/confirmation/thank_you.dart';
import 'package:dilibro_boat/services/confirmation/total.dart';
import 'package:flutter/material.dart';

//Confirmation shown to user before sending API REQ
//Wash Page has separate page because of daily & Weekly Stuff
class Confirmation extends StatelessWidget {
  final User user;
  final String serviceName;
  final DateTime date;
  final TimeOfDay time;
  final double cost;
  final Map<String, double> services;
  final String additionalInstructions;

  const Confirmation(
      {Key key,
      this.user,
      this.date,
      this.time,
      this.cost,
      this.services,
      this.additionalInstructions,
      this.serviceName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: confirmationAppBar(context, () async {}),
        body: ConfirmationCard(
          children: <Widget>[
            ThankYou(
              user: user,
              date: date,
              time: time,
              serviceName: serviceName,
            ),
            Summary(
              services: services,
              serviceName: serviceName,
            ),
            Total(
              cost: cost,
            )
          ],
        ));
  }
}
