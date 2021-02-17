import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import 'package:flutter/material.dart';

class ServicesReceipt extends StatelessWidget {
  final DateTime date;
  final TimeOfDay time;
  final double cost;

  const ServicesReceipt({Key key, this.date, this.time, this.cost}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        elevation: 16.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "My Appointment: ",
              style: instructionsTextStyle().copyWith(
                  fontSize: 20.0, decoration: TextDecoration.underline),
              textAlign: TextAlign.center,
            ),
            Text(
              "${date.month}/${date.day} @ ${time.hour}:${time.minute}",
              style: instructionsTextStyle().copyWith(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            Text(
              "Total: \$$cost",
              style: instructionsTextStyle().copyWith(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
