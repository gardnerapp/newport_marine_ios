import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import 'package:flutter/material.dart';

class ConfirmationRow extends StatelessWidget {
  final String message;
  final double price;

  const ConfirmationRow({Key key, this.message, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
    
       padding: const EdgeInsets.all(10.0),
       child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            instructionText(message), message.startsWith('Deck Hands') ? instructionText("$price") : instructionText("\$$price")
          ],
        ),
    );
  }
}
