import 'package:flutter/material.dart';
//TODO Make sure you put additional instructions in the API Post
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
