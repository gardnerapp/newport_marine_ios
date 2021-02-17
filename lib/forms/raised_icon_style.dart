import 'package:flutter/material.dart';

Icon iconDecoration(IconData iconData){
  return Icon(
    iconData,
    color:Colors.black87,
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
    color: Colors.black87,
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
    color: Colors.greenAccent,
    splashColor: Colors.blueGrey,
    shape: raisedButtonRoundedBorder(),
  );
}





