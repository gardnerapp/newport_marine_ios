import 'package:dilibro_boat/api/appointment_request.dart';
import 'package:dilibro_boat/services/wash/wash_text_styles.dart';

import '../confirmation/confirmation_appbar.dart';
import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/confirmation/confirmation_appbar.dart';
import 'package:dilibro_boat/services/confirmation/confirmation_card.dart';
import 'package:dilibro_boat/services/confirmation/summary.dart';
import 'package:dilibro_boat/services/confirmation/thank_you.dart';
import 'package:dilibro_boat/services/confirmation/total.dart';
import 'package:flutter/material.dart';

class WashConfirmation extends StatefulWidget {
  final User user;
  final DateTime date;
  final TimeOfDay time;
  final double cost;
  final Map<String, double> services;
  final String additionalInstructions;

  const WashConfirmation(
      {Key key,
      this.user,
      this.date,
      this.time,
      this.services,
      this.additionalInstructions,
      this.cost})
      : super(key: key);

  @override
  _WashConfirmationState createState() => _WashConfirmationState();
}

class _WashConfirmationState extends State<WashConfirmation> {
  bool weekly = false;
  bool daily = false;
  double costPerFoot = 16.0;

  @override
  Widget build(BuildContext context) {
    var time = "${widget.date.month}/${widget.date.day} ${widget.time.toString()}";
    AppointmentRequest appointmentRequest = AppointmentRequest();
    return Scaffold(
        appBar: confirmationAppBar(context, () async {
          try{
            var req = await appointmentRequest.createAppointment(
                "Wash", time, widget.cost, widget.user.id, widget.additionalInstructions, widget.services,
                widget.user.token);
            print(req.body);
          } on Exception catch (e) {
            print(e.toString());
          }

        }),
        body: ConfirmationCard(
          children: <Widget>[
            ThankYou(
              user: widget.user,
              date: widget.date,
              time: widget.time,
              serviceName: "Washed",
            ),
            Summary(
              serviceName: "Wash",
              services: widget.services,
            ),
            Total(
              cost: widget.cost,
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                instructionText("Weekly or Daily Wash?"),
                CheckboxListTile(
                    checkColor: Colors.blueGrey,
                    activeColor: Colors.greenAccent,
                    title: Text("Daily Wash"),
                    subtitle: Text("\$8.00 / ft"),
                    value: daily,
                    onChanged: (bool val) {
                      setState(() {
                        daily = val;
                        if (weekly) {
                          weekly = false;
                        }
                      });
                    }),
                CheckboxListTile(
                    checkColor: Colors.blueGrey,
                    activeColor: Colors.greenAccent,
                    title: Text("Weekly Wash"),
                    subtitle: Text("\$10.00 / ft"),
                    value: weekly,
                    onChanged: (bool val) {
                      setState(() {
                        weekly = val;
                        if (daily) {
                          daily = false;
                        }
                      });
                    }),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ));
  }
}
