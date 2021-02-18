
import 'package:flutter/material.dart';
import 'package:dilibro_boat/services/wash/wash_styles.dart';


class CabinWashSwitchTile extends StatefulWidget {

  final String option;
  final double optionCost;
  final Function handleChange;

  const CabinWashSwitchTile({Key key, this.option, this.optionCost, this.handleChange}) : super(key: key);
  @override
  _CabinWashSwitchTileState createState() => _CabinWashSwitchTileState();
}

class _CabinWashSwitchTileState extends State<CabinWashSwitchTile> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          elevation: 10.0,
          color: Colors.white,
          child: SwitchListTile(
            title: Text(
              this.widget.option,
              style: washCardTitle(),
            ),
            subtitle: Text(
              "\$${this.widget.optionCost} \\hr",
              style: washCardSubtitle(),
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