import 'package:flutter/material.dart';
//TODO Potentially Delete
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
          title: titleText("Windows Cleaned"),
          onChanged: (value) {  },
        ),
        RadioListTile(
          activeColor: Colors.blueGrey,
          title: titleText("Stainless Cleaned"),
          onChanged: (value) {},
        ),
        RadioListTile(
          activeColor: Colors.blueGrey,
          title: titleText("Leather Protection"),
          onChanged: (value) {},
        ),
        RadioListTile(
          activeColor: Colors.blueGrey,
          title: titleText("Soap Gun Wash"),
          onChanged: (value) {},
        ),
      ],
    );
  }

  Text titleText(String title){
    return Text(title, style: TextStyle(
      color: Colors.black87, fontSize: 18.0
    ));
  }
}
