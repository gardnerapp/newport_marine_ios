import 'package:dilibro_boat/app_bar_styling.dart';
import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/wash/confirmation_row.dart';
import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import 'package:flutter/material.dart';

class WashConfirmation extends StatelessWidget {
  final User user;
  final DateTime date;
  final TimeOfDay time;

  final Map<String, double> options;

  const WashConfirmation({Key key, this.user, this.date, this.time, this.options}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Checkout",
          Icons.arrow_back,
              () {
            Navigator.pop(context);
          },
          Icons.directions_boat,
              () {
            //Push to checkout
          }),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 16.0,
          shadowColor: Colors.blueGrey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              instructionText("Thank You ${user.name}!\n"),
              instructionText("The ${user.boat.name} Will Be Washed on ${date.month}/${date.day} @ ${time.hour}:${time.minute}\n"),
              instructionText(
                  "Confirm and book your appointment by tapping the boat\n"),
              Divider(
                height: 20,
                thickness: 2.50,
                color: Colors.blueGrey,
              ),
              SizedBox(
                height: 10,
              ),
              instructionText("Appointment Summary\n"),
              Column(
                children: getOrderSummary(options),
              ),
              SizedBox(
                height: 15.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getOrderSummary(Map<String, double> options) {
    List<Widget> confirmations = [];
    options.forEach((key, value) {
      confirmations.add(ConfirmationRow(
        message: key,
        price: value,
      ));
    });
    return confirmations;
  }
}
