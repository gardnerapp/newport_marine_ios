import 'package:dilibro_boat/forms/form_styles.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/appointments/book_appointment.dart';
import 'package:dilibro_boat/services/services_reciept.dart';
import 'package:dilibro_boat/services/wash/wash_confirmation.dart';
import 'package:dilibro_boat/services/wash/wash_switch_tile.dart';
import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import 'package:flutter/material.dart';
import 'cabin_maid.dart';
import 'igl_switch.dart';


class WashPage extends StatefulWidget {
  final User user;

  const WashPage({Key key, this.user}) : super(key: key);

  @override
  _WashPageState createState() => _WashPageState();
}

class _WashPageState extends State<WashPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 07, minute: 00);
  double cost = 16.0 * 20.0;//CostPer foot * boat length
  String additionalInstructions;
  Map<String, double> services = {};

  @override
  initState() {
    cost = this.widget.user.boat.length * 16.0; //cost per wash foot
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
              title: Text("Wash"),
          leading: new IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.pop(context);
          }),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            SizedBox(height: 10.0),
            instructionText("Our Washes typically take 2-3 hours\n"),
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
              handleChange: (bool value) => setState(() {
                double num = this.widget.user.boat.length * 5.0;
                if (value) {
                  cost += num;
                  services["Stainless Steel"] = num;
                } else {
                  cost = cost - num;
                  services.remove("Stainless Steel");
                }
              }),
            ),SizedBox(height: 10),
            WashSwitchTile(
              option: "Glass Polishing",
              optionCost: 3.0,
              handleChange: (bool value) => setState((){
                double num = this.widget.user.boat.length * 3.0;
                if(value){
                  cost += num;
                  services['Glass Polishing'] = num;
                }else{
                  cost = cost - num;
                  services.remove("Glass Polishing");
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
                    services['IGL Leather Protection'] = num;
                  }else{
                    cost = cost -num;
                    services.remove('IGL Leather Protection');
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
                  services['IGL Window'] = num;
                }else{
                  cost = cost -num;
                  services.remove('IGL Window');
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
                  services['IGL Teak'] = num;
                }else{
                  cost = cost -num;
                  services.remove("IGL Teak");
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
                  services['Cabin Maid'] = num;
                }else{
                  cost = cost - num;
                  services.remove('Cabin Maid');
                }
              }),
            ),SizedBox(height: 10),
            WashSwitchTile(
              option: "Compartment Cleaning * FREE *",
              optionCost: 0.0,
              handleChange: (bool value) {
                if (value) {
                  setState(() {
                    services['Compartment Cleaning'] = 0.0;
                  });
                }
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            ServicesReceipt(date: selectedDate, time: selectedTime, cost: cost),
            SizedBox(height: 25),
            TextFormField(
              decoration: textInputDecoration("Anything Else ?"),
              onChanged: (val){
                setState(() {
                  additionalInstructions = val;
                });
              },
            ),
            SizedBox(height: 10.0),
            customRaisedIconButton(
                Text(
                  "Continue",
                  style: raisedIconTextStyle(),
                ),
                iconDecoration(Icons.directions_boat),
                () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => WashConfirmation(
                        user: this.widget.user,
                        date: this.selectedDate,
                        time: this.selectedTime,
                        cost: this.cost,
                        services: this.services,
                        additionalInstructions: this.additionalInstructions,
                      )));
                })
          ],
        ));
  }
}
