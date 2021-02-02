import 'package:dilibro_boat/app_bar_styling.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("My Boat", style: appBarTitle()),
      ),
        body: Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
      child: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Tell us about your boat", style: formTitleStyle()),
            //SizedBox(height: 25.0),
            Container(
                width: 400,
                child: TextFormField(
                  decoration: textInputDecoration("Name..."),
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                  validator: (val) => val.isEmpty
                      ? "You forget to enter the name of your vessel !"
                      : null,
                )),
            Text("My vessel is $length ft.", style: formTitleStyle()),
            SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.blueGrey[400],
                    inactiveTrackColor: Colors.blueGrey[100],
                    trackHeight: 3.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                  ),
                  child: Slider(
                    value: length,
                    min: 0,
                    max: 250,
                    divisions: 50,
                    label: "$length ft.",
                    activeColor: Colors.blueGrey[200],
                    onChanged: (val) {
                      setState(() {
                        length = val;
                      });
                    },
                  ),
                ),
                Text("It is docked at:", style: formTitleStyle()),
            Container(
                width: 400,
                child: TextFormField(
                  decoration: textInputDecoration("Marina..."),
                  onChanged: (val) {
                    setState(() {
                      location = val;
                    });
                  },
                  validator: (val) => val.isEmpty
                      ? "Where do you doc your vessel?"
                      : null,
                )),
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
    ));
  }
}
