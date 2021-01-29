import 'package:flutter/material.dart';

//TODO make const or borde radius styling
//TODO and make button look smexy

textInputDecoration(String label) {
  return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: Colors.black87,
        fontSize: 20.0),
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.blueGrey, width: 2.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0)),
    contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
  );
}