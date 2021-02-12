import 'package:flutter/material.dart';

class WashSwitchTile extends StatefulWidget {

  final String option;
  final double optionCost;
  final Function handleChange;

  const WashSwitchTile({Key key, this.option, this.optionCost, this.handleChange}) : super(key: key);
  @override
  _WashSwitchTileState createState() => _WashSwitchTileState();
}

class _WashSwitchTileState extends State<WashSwitchTile> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          elevation: 10.0,
      color: Colors.white70,
      child: SwitchListTile(
        title: Text(
          this.widget.option,
          style: TextStyle(
              color: Colors.black87,
              fontSize: 20.0,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          "${this.widget.optionCost} \\ft",
          style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
              fontWeight: FontWeight.w300),
        ),
        inactiveThumbColor: Colors.blueGrey,
        activeColor: Colors.greenAccent,
        value: _value,
        onChanged: (bool newValue) {
          setState(() {
            _value = newValue;
            this.widget.handleChange(_value);
          });
        },
      ),
    ));
  }
}
