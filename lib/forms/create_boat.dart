import 'package:dilibro_boat/forms/form_styles.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:flutter/material.dart';
import '../models/boat.dart';

//TODO make sliude same width as other form elems
// A form for creating user Boat
class CreateBoat extends StatefulWidget {
  @override
  _CreateBoatState createState() => _CreateBoatState();
}

class _CreateBoatState extends State<CreateBoat> {
  final _key = GlobalKey<FormState>();
  String name;
  String location;
  double length = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
      child: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Please tell us about your vessel", style: TextStyle(
              color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w300
            )),
            SizedBox(height: 25.0),
            Container(
                width: 400,
                child: TextFormField(
                  decoration: textInputDecoration("Vessel Name"),
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                  validator: (val) => val.isEmpty
                      ? "You forget to enter the name of your vessel !"
                      : null,
                )),
            SizedBox(height: 25.0),
            Slider(value: length,
                min: 0,
                max: 250,
                divisions: 25,
                label: "$length ft.",
                activeColor: Colors.blueGrey[200],
                onChanged: (val){
                  setState(() {
                    length = val;
                  });
                },
            ),
            SizedBox(height: 25.0),
            Container(
                width: 400,
                child: customRaisedIconButton(
                  Text(
                    "Submit",
                    style: raisedIconTextStyle(),
                  ),
                  iconDecoration(Icons.directions_boat),
                  () async {
                    if (_key.currentState.validate()) {
                      //TODO loading, submit request
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
