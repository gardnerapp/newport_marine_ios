import 'package:flutter/material.dart';

confirmationAppBar(BuildContext context){
  return AppBar(
    title: Text("Your Appointment"),
    actions: <Widget>[
      IconButton(
          icon: Icon(Icons.directions_boat),
          onPressed: () {
            Navigator.pop(context);
          }),
    ],
  );
}
