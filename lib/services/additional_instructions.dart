import 'package:dilibro_boat/forms/form_styles.dart';
import 'package:flutter/material.dart';

class AdditionalInstructions extends StatefulWidget {
  final Function callBack;
  final String hog;

  const AdditionalInstructions({Key key, this.callBack, this.hog}) : super(key: key);
  @override
  _AdditionalInstructionsState createState() => _AdditionalInstructionsState();
}

class _AdditionalInstructionsState extends State<AdditionalInstructions> {
  final _key = GlobalKey<FormState>();
  String instructions;
  var cost;
  @override
  Widget build(BuildContext context) {
    var x = this.widget.hog;
    setState(() {
      cost = x;
    });
    return Form(
        key: _key,
        child: Container(
          width: 400,
          child: TextFormField(
            decoration: textInputDecoration("Additional Instructions"),
            onChanged: (val){
              setState(() {
                instructions = val;
              });
              this.widget.callBack(instructions);
            },
          ),
        ));
  }
}
