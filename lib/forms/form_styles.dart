import 'package:flutter/material.dart';


//TODO and make button look smexy

textInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: TextStyle(color: Colors.black87, fontSize: 20.0),
    fillColor: Colors.white,
    filled: true,
    enabledBorder: formBorder(Colors.white70),
    focusedBorder: formBorder(Colors.blueGrey[200]),
    errorBorder: formBorder(Colors.red),
    contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
  );
}

OutlineInputBorder formBorder(Color color) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: color, width: 3.0));
}