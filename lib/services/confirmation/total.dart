import 'package:dilibro_boat/services/wash/confirmation_row.dart';
import 'package:flutter/material.dart';

class Total extends StatelessWidget {
  final double cost;

  const Total({Key key, this.cost}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Divider(
          height: 20,
          thickness: 2.50,
          color: Colors.blueGrey,
        ),
        ConfirmationRow(
          message: "Total: ",
          price: cost,
        ),
        SizedBox(
          height: 15.0,
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
