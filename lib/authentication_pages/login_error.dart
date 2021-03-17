import 'package:flutter/material.dart';

class LoginError extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Error !!"),
          elevation: 16.0,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.pop(context);
          }),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
              child: Text(
            "Please contact customer service for help\n https://newportmarine.app",
            style: TextStyle( fontSize: 30.0),textAlign: TextAlign.center,
          )),
        ));
  }
}