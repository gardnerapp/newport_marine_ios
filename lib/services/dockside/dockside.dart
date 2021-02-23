import 'package:dilibro_boat/forms/form_styles.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/appointments/book_appointment.dart';
import 'package:dilibro_boat/services/confirmation/conirmation.dart';
import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import 'package:flutter/material.dart';

//TODO Scrollable Widget for the number of needed hands

class DockSide extends StatefulWidget {
  final User user;

  const DockSide({Key key, this.user}) : super(key: key);
  @override
  _DockSideState createState() => _DockSideState();
}

class _DockSideState extends State<DockSide> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String restock;
  double cost;
  Map<String,double> services ={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dock Side"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            SizedBox(height: 10),
            instructionText("Please Include How many hands you will need\n"),
            instructionText("And Your Time Of Arrival/Departure\n"),

            //Number of Hands Needed
            //Restcok

            Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey[600]),
            SizedBox(height:15),
            instructionText(
              "Arrival/Departure Time",
            ),
            SizedBox(height: 15),
            BookAppointment(
              handleDateChange: (DateTime date) => setState(() {selectedDate = date;}),
              handleTimeChange: (TimeOfDay time) => setState((){selectedTime = time;}),
            ),
            SizedBox(height: 25),
            TextFormField(
              decoration: textInputDecoration("Supplies Restock ? "),
              onChanged: (val){
                setState(() {
                  restock = val;
                });
              },
            ),
            SizedBox(height: 25,),
            customRaisedIconButton(
                Text(
                  "Continue",
                  style: raisedIconTextStyle(),
                ),
                iconDecoration(Icons.directions_boat),
                    () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Confirmation(
                    user: widget.user,
                    date: selectedDate,
                    time: selectedTime,
                    cost: cost,
                    serviceName: "Full Detail",
                    services: services,
                    additionalInstructions: restock,
                  )));
                })

          ],
        ),
      ),
    );
  }
}
