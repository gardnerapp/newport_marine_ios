import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/services/additional_instructions.dart';
import 'package:dilibro_boat/services/appointments/book_appointment.dart';
import 'package:dilibro_boat/services/wash/wash_switch_tile.dart';
import 'package:flutter/material.dart';
import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import '../../app_bar_styling.dart';
import '../services_reciept.dart';

class FullDetail extends StatefulWidget {
  @override
  _FullDetailState createState() => _FullDetailState();
}

class _FullDetailState extends State<FullDetail> {
  double cost = costPerFoot * 12.0;
  static double costPerFoot = 16.0;
  var selectedDate = DateTime.now();
  var selectedTime = TimeOfDay.now();
  String instructions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          "Full Detail",
          Icons.arrow_back,
          () {
            Navigator.pop(context);
          },
          Icons.calendar_today,
          () {
            //Push to List of Appointments
          }),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          SizedBox(height: 10),
          instructionText("Compound Wax & Polish\n"),
          instructionText("One Season of Protection\n"),
          instructionText("Non-skid Cleaning\n"),
          instructionText("Stainless Steel Polishing\n"),
          instructionText("Window Polishing / RainX\n"),
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
          ServicesReceipt(date: selectedDate, time: selectedTime, cost: cost),
          SizedBox(height: 20),
          SizedBox(height: 25),
          customRaisedIconButton(
              Text(
                "Continue",
                style: raisedIconTextStyle(),
              ),
              iconDecoration(Icons.directions_boat),
                  () {})
        ],
      ),
    );
  }
}
