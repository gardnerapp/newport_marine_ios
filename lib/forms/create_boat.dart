import 'package:dilibro_boat/forms/form_styles.dart';
import 'package:flutter/material.dart';
import '../models/boat.dart';

// A form for creating user Boat
//TODO flash confirmatipn, round edges o form field
class CreateBoat extends StatefulWidget {
  @override
  _CreateBoatState createState() => _CreateBoatState();
}

class _CreateBoatState extends State<CreateBoat> {
  final _key = GlobalKey<FormState>();
  String name;
  double length;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
      child: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: textInputDecoration("Vessel Name"),
              onChanged: (val){
                setState(() {
                  name = val;
                });
              },
              validator: (val) => val.isEmpty ? "You forget to enter the name of your vessel !" : null,
            ),
            SizedBox(height: 20.0),
            RaisedButton.icon(
              icon: Icon(Icons.directions_boat),
              label: Text("Submit"),
              onPressed: () async {
                print(name);
                if(_key.currentState.validate()){
                  //TODO loading, submit request
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
