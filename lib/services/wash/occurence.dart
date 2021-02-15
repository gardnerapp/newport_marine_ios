import 'package:flutter/material.dart';

class Occurence extends StatefulWidget {

  //TODO SetState of Parent to set cost per foot with CallBack

  @override
  _OccurenceState createState() => _OccurenceState();
}

class _OccurenceState extends State<Occurence> {
  int _groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(
          activeColor: Colors.blueGrey,
          value: 0,
          groupValue: _groupValue,
          onChanged: _handleChange,
          title: Text("One Time Wash"),
          subtitle: Text("\$13.00 /ft"),
        ),
        RadioListTile(
          activeColor: Colors.blueGrey,
          value: 1,
          groupValue: _groupValue,
          onChanged: _handleChange,
          title: Text("Weekly Wash"),
          subtitle: Text("\$10.00 /ft"),
        ),
        RadioListTile(
          activeColor: Colors.blueGrey,
          value: 2,
          groupValue: _groupValue,
          onChanged: _handleChange,
          title: Text("Daily Wash"),
          subtitle: Text("\$8.00 /ft"),
        )
      ],
    );
  }

  _handleChange(int i){
    setState(() {
      _groupValue = i;

    });

  }
}
