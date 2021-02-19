import 'package:dilibro_boat/calender/calender.dart';
import 'package:flutter/material.dart';

class RouteCalender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.calendar_today),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Calender()));
        });
  }
}
