import 'package:dilibro_boat/app_bar_styling.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/models/boat.dart';
import 'package:dilibro_boat/services/appointments/book_appointment.dart';
import 'package:dilibro_boat/services/services_reciept.dart';
import 'package:dilibro_boat/services/wash/wash_switch_tile.dart';
import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import 'package:flutter/material.dart';

import 'cabin_maid.dart';
import 'igl_switch.dart';

//TODO weekly Wash Savings

class WashPage extends StatefulWidget {
  final Boat boat;

  const WashPage({Key key, this.boat}) : super(key: key);

  @override
  _WashPageState createState() => _WashPageState();
}

class _WashPageState extends State<WashPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 07, minute: 00);
  //TODO figure out how to combine Time of day with DateTime
  //TODO Store details into map in order to make Reciept, this JSON will be passwed as text to the backend
  //create wash details list bullets
  //move radio buttons to next page
  // and do forms

  double cost = costPerFoot * 12.0;
  static double costPerFoot = 16.0;
  String additionalInstructions;

  @override
  Widget build(BuildContext context) {
//TODO wrap text in expandeds
    return Scaffold(
      appBar: customAppBar("Wash", Icons.arrow_back, (){
        Navigator.pop(context);
      }, Icons.directions_boat, (){
        //Push to checkout
      }),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            SizedBox(height: 10.0),
            instructionText(
              "Our Washes typically take 2-3 hours\n"
            ),
            instructionText("Discounts for daily, weekly and biweekly wash plans\n"),
            Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey[600]),
            SizedBox(height: 15),
            Text(
              "Which time and date work for you? ",
              style: instructionsTextStyle(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            BookAppointment(
              handleDateChange: (DateTime date) => setState(() {selectedDate = date;}),
              handleTimeChange: (TimeOfDay time) => setState((){selectedTime = time;}),
            ),
            SizedBox(height: 25),
            Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey[600]),
            SizedBox(height: 20),
            instructionText("Select Your Options:"),
            SizedBox(height: 20),
            WashSwitchTile(
              option: "Stainless Steel",
              optionCost: 5.0,
              handleChange: (bool value) => setState((){
                double num = this.widget.boat.length * 5.0;
                if(value){
                      cost += num;
                }else{
                  cost = cost - num;
                }
              }),
            ),SizedBox(height: 10),
            WashSwitchTile(
              option: "Glass Polishing",
              optionCost: 3.0,
              handleChange: (bool value) => setState((){
                double num = this.widget.boat.length * 3.0;
                if(value){
                  cost += num;
                }else{
                  cost = cost - num;
                }
              }),
            ),SizedBox(height: 10),
            IGLWashSwitchTile(
                option: "IGL Leather Protection",
                optionCost: 300.0,
                handleChange: (bool value) => setState((){
                  double num = 300.0;
                  if(value){
                    cost +=num;
                  }else{
                    cost = cost -num;
                  }
                })
            ),
            SizedBox(height: 10),
            IGLWashSwitchTile(
              option: "IGL Window",
              optionCost: 400.0,
              handleChange: (bool value) => setState((){
                double num = 400.0;
                if(value){
                  cost +=num;
                }else{
                  cost = cost -num;
                }
              })
            ),SizedBox(height: 10),
            IGLWashSwitchTile(
              option: "IGL Teak",
              optionCost:400.0,
              handleChange: (bool value) => setState((){
                double num = 300.0;
                if(value){
                  cost +=num;
                }else{
                  cost = cost -num;
                }
              }),
            ),SizedBox(height: 10),
            CabinWashSwitchTile(
              option: "Cabin Maid",
              optionCost: 16.0,
              handleChange: (bool value) => setState((){
                double num = 16.0;
                if(value){
                  cost +=num;
                }else{
                  cost = cost -num;
                }
              }),
            ),SizedBox(height: 10),
            WashSwitchTile(
              option: "Compartment Cleaning * FREE *",
              optionCost: 0.0,
              handleChange: (bool value) {},
            ),
            SizedBox(
              height: 30.0,
            ),
            ServicesReceipt(date: selectedDate, time: selectedTime, cost: cost),
            SizedBox(height: 25),
            customRaisedIconButton(
                Text(
                  "Continue",
                  style: raisedIconTextStyle(),
                ),
                iconDecoration(Icons.directions_boat),
                () {})
          ],
        ));
  }

}
