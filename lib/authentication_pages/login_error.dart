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
            "Invalid Authentication Contact Customer Serivce for help:\n\n401-***-****",
            style: TextStyle(color: Colors.red, fontSize: 30.0),textAlign: TextAlign.center,
          )),
        ));
  }
}