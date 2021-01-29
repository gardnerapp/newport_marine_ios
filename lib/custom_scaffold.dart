import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {

  final Widget widget;

  const CustomScaffold({Key key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Newport Marine",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20.0,
            ),
          ),
          elevation: 16.0,
          leading: IconButton(
              icon: Icon(
                Icons.directions_boat,
                color: Colors.black87,
                size: 30.0,
              ),
              splashColor: Colors.white,
              onPressed: () {})),
      body: widget,
    );
  }
}
