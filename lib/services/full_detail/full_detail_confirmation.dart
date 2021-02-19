import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/wash/confirmation_row.dart';
import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import 'package:flutter/material.dart';

class DetailConfirmation extends StatefulWidget {
  final User user;
  final DateTime date;
  final TimeOfDay time;
  final double cost;
  final Map<String, double> services;
  final String additionalInstructions;

  const DetailConfirmation(
      {Key key,
        this.user,
        this.date,
        this.time,
        this.services,
        this.additionalInstructions,
        this.cost})
      : super(key: key);

  @override
  _DetailConfirmationState createState() => _DetailConfirmationState();
}

class _DetailConfirmationState extends State<DetailConfirmation> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Your Appointment"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.directions_boat),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 8.0,
            shadowColor: Colors.blueGrey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                instructionText("Thank You ${widget.user.name}!\n"),
                instructionText(
                    "The ${widget.user.boat.name} will be fully detailed on ${widget.date.month}/${widget.date.day} @ ${widget.time.hour}:${widget.time.minute}\n"),
                instructionText(
                    "Confirm and book your appointment by tapping the boat in the top right corner\n"),
                Divider(
                  height: 20,
                  thickness: 2.50,
                  color: Colors.blueGrey,
                ),
                SizedBox(
                  height: 10,
                ),
                instructionText("Appointment Summary:\n"),
                widget.services.isEmpty
                    ? instructionText("Full Detail\n")
                    : Container(
                  child: Wrap(
                    children: getOrderSummary(widget.services),
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 2.50,
                  color: Colors.blueGrey,
                ),
                ConfirmationRow(
                  message: "Total: ",
                  price: widget.cost,
                ),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
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
