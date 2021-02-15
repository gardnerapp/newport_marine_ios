import 'package:dilibro_boat/app_bar_styling.dart';
import 'package:dilibro_boat/appointments/book_appointment.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/services/wash/occurence.dart';
import 'package:dilibro_boat/services/wash/wash_switch_tile.dart';
import 'package:flutter/material.dart';

//TODO weekly Wash Savings

class WashPage extends StatefulWidget {

  @override
  _WashPageState createState() => _WashPageState();
}

class _WashPageState extends State<WashPage> {
  DateTime selectedDate = DateTime.now();

  //TODO figure out how to combine Time of day with DateTime
  //TODO Store details into map in order to make Reciept, this JSON will be passwed as text to the backend
  //Map<String, double> tring == the service, double is the cost per foor of service
  TimeOfDay selectedTime = TimeOfDay(hour: 07, minute: 00);
  double cost = costPerFoot * boatLen;
  static double costPerFoot = 16.0;
  static double boatLen = 22.0;
  String additionalInstructions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Wash", Icons.arrow_back, (){
        Navigator.pop(context);
      }, Icons.directions_boat, (){
        //Push to checkout
      }),
        body: ListView(
          padding: const EdgeInsets.all(25.0),
          children: <Widget>[
            SizedBox(height: 5.0),
            Text(
              "Our Washes typically take 1-2 hours\nPlease be at the dock 10 minutes before arrival",
              style: instructionsTextStyle(),
              textAlign: TextAlign.center,
            ),
            Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey[600]),
            SizedBox(height: 10),
            Text(
              "Wash Frequency?",
              style: instructionsTextStyle(),
              textAlign: TextAlign.center,
            ),
            Occurence(
            ),
            SizedBox(height: 10),
            Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey[600]),
            Text(
              "Appointment Time and Date:",
              style: instructionsTextStyle(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            BookAppointment(
              handleChange: () {
                setState(() {
                  // Select && Display Time
                });
              }
            ),
            SizedBox(height: 15),
            Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey[600]),
            Text(
              "Select Your Options:",
              style: instructionsTextStyle(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            WashSwitchTile(
              option: "Stainless Steel",
              optionCost: 5.0,
              handleChange: (bool value) => setState((){
                double num = boatLen * 5.0;
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
                double num = boatLen * 3.0;
                if(value){
                  cost += num;
                }else{
                  cost = cost - num;
                }
              }),
            ),SizedBox(height: 10),
              WashSwitchTile(
             option: "Compartment Cleaning * FREE *",
                optionCost: 0.0,
                handleChange: (bool value){},
           ),
            WashSwitchTile(
              option: "Cabin Maid",
              optionCost: 16.0,
              handleChange: (bool value) => setState((){
                double num = boatLen * 16.0;
                if(value){
                  cost += num;
                }else{
                  cost = cost - num;
                }
              }),
            ),
            SizedBox(height: 30.0,),
            Container(
              height: 200.0,
              child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.white70,
              elevation: 16.0,

              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "My Appointment: ",
                    style: instructionsTextStyle().copyWith(
                        fontSize: 20.0, decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "March 15th 12:00AM",
                    style: instructionsTextStyle().copyWith(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Total: \$$cost",
                  style: instructionsTextStyle().copyWith(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ],),
            ),),
            SizedBox(height: 10),

            SizedBox(height: 15),
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

  void setTotal(bool val, double optionCost){

}

  TextStyle instructionsTextStyle(){
    return TextStyle(
      color: Colors.black87, fontSize: 18.0,
    );
  }

}
