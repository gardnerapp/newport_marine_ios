import 'package:dilibro_boat/services/receipt.dart';
import 'package:dilibro_boat/services/services_home.dart';
import 'package:flutter/material.dart';

//TODO Finish Thank You
class ThankYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thank You !'),
        leading: IconButton(icon: Icon(Icons.home), onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesHome()));
        }),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Receipt()
            ],
          )
        ),
      )
      );
  }
}


