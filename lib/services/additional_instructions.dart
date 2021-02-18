import 'package:dilibro_boat/forms/form_styles.dart';
import 'package:flutter/material.dart';

class AdditionalInstructions extends StatefulWidget {
  final Function callBack;

  const AdditionalInstructions({Key key, this.callBack}) : super(key: key);
  @override
  _AdditionalInstructionsState createState() => _AdditionalInstructionsState();
}

class _AdditionalInstructionsState extends State<AdditionalInstructions> {
  final _key = GlobalKey<FormState>();
  String instructions;

  @override
  Widget build(BuildContext context) {
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
