import 'package:dilibro_boat/models/user.dart';
import 'package:flutter/material.dart';

// TODO route home ;)

class AllSet extends StatelessWidget {
  final String message;
  final User user;

  const AllSet({Key key, this.message, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(child: Text(message, style: TextStyle(
            fontSize: 20.0
        ),),
        ),
      ),
    );
  }
}
