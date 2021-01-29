import 'package:flutter/material.dart';

Icon iconDecoration(IconData iconData){
  return Icon(
    iconData,
    color:Colors.white,
    size: 30.0,
  );
}

RoundedRectangleBorder raisedButtonRoundedBorder(){
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0)
  );
}


TextStyle raisedIconTextStyle(){
  return TextStyle(
    color: Colors.white,
    fontSize: 30.0
  );
}

customRaisedIconButton(Text label, Icon icon, Function onPressed ){
  return RaisedButton.icon(
    icon: icon,
    label: label,
    onPressed: onPressed,
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
    elevation: 10.0,
    color: Colors.blueGrey[200],
    splashColor: Colors.white70,
    shape: raisedButtonRoundedBorder(),
  );
}





