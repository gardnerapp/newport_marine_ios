import 'package:dilibro_boat/forms/form_styles.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/appointments/book_appointment.dart';
import 'package:dilibro_boat/services/confirmation/conirmation.dart';
import 'package:dilibro_boat/services/wash/wash_switch_tile.dart';
import 'package:flutter/material.dart';
import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import '../services_reciept.dart';

class FullDetail extends StatefulWidget {
  final User user;

  const FullDetail({Key key, this.user}) : super(key: key);
  @override
  _FullDetailState createState() => _FullDetailState();
}

class _FullDetailState extends State<FullDetail> {
  double cost;
  double costPerFoot;
  var selectedDate = DateTime.now();
  var selectedTime = TimeOfDay.now();
  String additionalInstructions;
  Map<String,double> services = {};

  @override
  initState() {
    var length = widget.user.boat.length;
    if( length < 30.0){
      costPerFoot = 28.0;
    }else if(length > 30.0 && length < 40){
      costPerFoot = 30.0;
    }else{
      costPerFoot = 37.0;
    }
    cost = length * costPerFoot;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full Detail"),
        elevation: 16.0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          SizedBox(height: 10),
          instructionText("Compound Wax & Polish\n"),
          instructionText("One Season of Protection\n"),
          instructionText("Stainless Steel Polishing\n"),
          instructionText("Eisen Glass Cleaning\n"),
          instructionText("Oxidation Removal\n"),
          Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey[600]),
          SizedBox(height:15),
          instructionText(
            "Compound Polish/Wax Topside: \n",
          ),
          instructionText("Boats 20-30 @ \$28 / ft\n"),
          instructionText("Boats 30-40 @ \$30 / ft\n"),
          instructionText("Boats 40-100 @ \$37 / ft\n"),
          SizedBox(height: 15),
          Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey[600]),
          instructionText(
            "Appointment Time and Date:",
          ),
          SizedBox(height: 15),
          BookAppointment(
            handleDateChange: (DateTime date) => setState(() {selectedDate = date;}),
            handleTimeChange: (TimeOfDay time) => setState((){selectedTime = time;}),
          ),
          SizedBox(height: 25),
          Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey[600]),
          SizedBox(height: 20),
          instructionText("Specify Any Unlisted Services Below\n"),
          instructionText("Pricing Will Vary"),
          SizedBox(height: 20),
          TextFormField(
            decoration: textInputDecoration("Anything else ?"),
            onChanged: (val){
              setState(() {
                additionalInstructions = val;
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
                  additionalInstructions: additionalInstructions,
                )));
                  })
        ],
      ),
    );
  }
}
