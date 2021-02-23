import 'package:dilibro_boat/services/wash/confirmation_row.dart';
import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  final Map<String, double> services;
  final String serviceName;

  const Summary({Key key, this.services, this.serviceName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          height: 20,
          thickness: 2.50,
          color: Colors.blueGrey,
        ),
        SizedBox(
          height: 10,
        ),
        instructionText("Appointment Summary:\n"),
        services.isEmpty
            ? instructionText("$serviceName\n")
            : Container(
          child: Wrap(
            children: getOrderSummary(services),
          ),
        ),
      ],
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
