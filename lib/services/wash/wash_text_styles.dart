import 'package:flutter/material.dart';

TextStyle instructionsTextStyle() {
  return TextStyle(
    color: Colors.black87,
    fontSize: 18.0,
  );
}

Text instructionText(String val) {
  return Text(
    val,
    style: instructionsTextStyle(),
    textAlign: TextAlign.center,
  );
}