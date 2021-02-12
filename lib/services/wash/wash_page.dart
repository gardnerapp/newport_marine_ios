import 'package:dilibro_boat/app_bar_styling.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/services/wash/wash_switch_tile.dart';
import 'package:flutter/material.dart';

//TODO weekly Wash Savings

class WashPage extends StatefulWidget {

  @override
  _WashPageState createState() => _WashPageState();
}

class _WashPageState extends State<WashPage> {
  double cost = 16 * 22.0;
  double boatLen = 22.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Daily Wash", Icons.arrow_back, (){

      }, Icons.shopping_cart, (){}),
        body: ListView(
          padding: const EdgeInsets.all(25.0),
          children: <Widget>[
            SizedBox(height: 5.0),
            Text(
              "Our Washes typically take an hour\nPlease be at the dock 10 minutes before arrival\nStandard Wash \$16.0\\ft",
              style: instructionsTextStyle(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Select Your Options:",
              style: instructionsTextStyle(),
              textAlign: TextAlign.center,
            ),
            Divider(height: 20.0, thickness: 2.5, color: Colors.blueGrey[600]),
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
           /* WashSwitchTile(
              option: "Window Cleaning",
              optionCost: 10.0,
            ), */
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
            Text(
              "Current Cost: \$$cost",
              style: instructionsTextStyle().copyWith(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            SizedBox(height: 15),
            customRaisedIconButton(
                Text(
                  "Continue",
                  style: raisedIconTextStyle(),
                ),
                iconDecoration(Icons.calendar_today),
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
