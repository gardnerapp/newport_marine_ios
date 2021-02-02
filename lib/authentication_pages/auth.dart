import 'package:dilibro_boat/app_bar_styling.dart';
import 'package:dilibro_boat/authentication_pages/sign_in.dart';
import 'package:dilibro_boat/authentication_pages/sign_up.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:flutter/material.dart';


class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showSignUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Newport Marine",
              style: appBarTitle(),
            ),
            elevation: 16.0,
            leading: IconButton(
                icon: iconDecoration(Icons.swap_horiz),
                onPressed: () {
                  setState(() {
                    showSignUp = !showSignUp;
                  });
                })),
        body: Container(child: showSignUp ? SignUp() : SignIn()));
  }
}
