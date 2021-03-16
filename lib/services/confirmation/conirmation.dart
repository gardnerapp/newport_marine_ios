import 'package:dilibro_boat/api/appointment_request.dart';
import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/confirmation/all_set.dart';
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
    var time = "${date.month}/${date.day} ${this.time.toString()}";
    AppointmentRequest appointmentRequest = AppointmentRequest();
    return Scaffold(
        appBar: confirmationAppBar(context, () async {
          try{
            var req = await appointmentRequest.createAppointment(
                "Wash", time, cost, user.id, additionalInstructions, services,
                user.token);
            if(req.statusCode == 202){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AllSet(
                message: "Thank You !",
                user: user,
              )));
            }else{
              Navigator.push(context, MaterialPageRoute(builder: (context) => AllSet(
                message: "Error !",
                user: user,
              )));
            }
          } on Exception catch (e) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AllSet(
              message: "Error !!",
              user: user,
            )));
          }

        }),
        body: ConfirmationCard(
          children: <Widget>[
            ThankYou(
              user: user,
              date: date,
              time: this.time,
              serviceName: serviceName,
            ),
            Summary(
              services: services,
              serviceName: serviceName,
            ),
            cost == null ? Total(cost: 0.00) :
            Total(
              cost: cost,
            )
          ],
        ));
  }
}
