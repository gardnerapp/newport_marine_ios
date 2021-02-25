import 'dart:convert';

import 'package:dilibro_boat/api/authentication_request.dart';
import 'package:dilibro_boat/app_bar_styling.dart';
import 'package:dilibro_boat/forms/form_styles.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/services_home.dart';
import 'package:flutter/material.dart';
import '../models/boat.dart';
import 'create_boat_error.dart';


// A form for creating user Boat
class CreateBoat extends StatefulWidget {
  final User user;

  const CreateBoat({Key key, this.user}) : super(key: key);
  @override
  _CreateBoatState createState() => _CreateBoatState();
}

class _CreateBoatState extends State<CreateBoat> {
  AuthenticationRequest auth = AuthenticationRequest();
  final _key = GlobalKey<FormState>();
  String name;
  String location;
  double length = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 16.0,
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
                    activeTrackColor: Colors.greenAccent[800],
                    inactiveTrackColor: Colors.greenAccent[800],
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
                    activeColor: Colors.greenAccent[800],
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
                      var req = await auth.createBoat(widget.user.id, widget.user.token ,name, length, location );
                      if (req.statusCode == 202) {
                        Boat boat = Boat.fromMap(jsonDecode(req.body));
                        widget.user.boat = boat;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ServicesHome(user: widget.user,)));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateBoatError()));
                          }
                        }
                      },
                    ))
              ],
            ),
      ),
    ));
  }
}
