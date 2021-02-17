import 'package:flutter/material.dart';

class BookFloatingAction extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;

  const BookFloatingAction({Key key, this.onPressed, this.iconData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: onPressed,
    backgroundColor: Colors.greenAccent,
      child: Icon(iconData, size: 35.0, color: Colors.black87,),
      elevation: 16.0,
      splashColor: Colors.blueGrey[600]
    );
  }
}
