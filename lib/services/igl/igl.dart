import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/services/appointments/book_appointment.dart';
import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import 'package:flutter/material.dart';
import '../../app_bar_styling.dart';
import '../services_reciept.dart';

class IGLHome extends StatefulWidget {
  @override
  _IGLHomeState createState() => _IGLHomeState();
}

class _IGLHomeState extends State<IGLHome> {
  double cost = costPerFoot * 12.0;
  static double costPerFoot = 16.0;
  var selectedDate = DateTime.now();
  var selectedTime = TimeOfDay.now();
  String instructions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          "IGL Ceramics Application",
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
          instructionText("Full Detail with 3M finishing products\n"),
          instructionText("Oxidation Removal\n"),
          instructionText("Compounding & Polishing\n"),
          Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey[600]),
          SizedBox(height:15),
          instructionText(
            "Pricing: \n",
          ),
          instructionText("\$550 for IGL Marine Boats 15-40 ft\n"),
          instructionText("\$1,900 for IGL Marine Boats 40-100 ft\n"),
          SizedBox(height: 15),
          Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey[600]),
          instructionText(
            "\nAppointment Time and Date:",
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