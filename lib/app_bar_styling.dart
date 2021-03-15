import 'package:flutter/material.dart';

AppBar customAppBar(String title, IconData leadingIconData,
    Function leadingOnPressed, IconData actionIconData, actionOnPressed) {
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.black87,
    ),
    title: Text(
      title,
      style: appBarTitle(),
    ),
    elevation: 16.0,
    leading: IconButton(
      iconSize: 35.0,
      splashColor: Colors.blueGrey,
      icon: Icon(leadingIconData),
      onPressed: leadingOnPressed,
    ),
    actions: <Widget>[
      IconButton(
          splashColor: Colors.blueGrey,
          iconSize: 35.0,
          icon: Icon(
            actionIconData,
          ),
          onPressed: actionOnPressed)
    ],
  );
}

TextStyle appBarTitle(){
  return TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.0,
    fontSize: 30.0,
  );
}

