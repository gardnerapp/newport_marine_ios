import 'package:dilibro_boat/forms/form_styles.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/appointments/book_appointment.dart';
import 'package:dilibro_boat/services/igl/product_page_view.dart';
import 'package:dilibro_boat/services/wash/wash_text_styles.dart';
import 'package:flutter/material.dart';
import '../services_reciept.dart';

class IGLHome extends StatefulWidget {
  final User user;

  const IGLHome({Key key, this.user}) : super(key: key);
  @override
  _IGLHomeState createState() => _IGLHomeState();
}

class _IGLHomeState extends State<IGLHome> {
  double cost;
  var selectedDate = DateTime.now();
  var selectedTime = TimeOfDay.now();
  String additionalInstructions;
  Map<String,double> services = {};

  @override
  void initState() {
    if (widget.user.boat.length < 40.0) {
      cost = 550.0;
    } else {
      cost = 1900.0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IGL Ceramics"),
      ),
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
          SizedBox(height: 15),
          instructionText("Swipe to View Our IGL Products\n"),
          ProductPageView(
            user: widget.user,
            callBack: (String item, double price){
              setState(() {
                services[item] = price;
              });
            },
          ),
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
          TextFormField(
            decoration: textInputDecoration("Anything Else ?"),
            onChanged: (val){
              setState(() {
                additionalInstructions = val;
              });
            },
          ),
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