import 'package:flutter/material.dart';
//Logo Image
// Circular pictures, horizontal List view of Services or Grid View
//Carousel ? More Images ? Social Media footers // General information
class ServicesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          Text("Thank You For Choosing ", style: TextStyle(
            color: Colors.black87, fontSize: 30.0
          ),),
          Container(
            height: 200,
            width: 400,
            child: Image(image: AssetImage("lib/assets/img/full_logo.png")),
          ),
          Text("Our Services", style: TextStyle(
              color: Colors.black87, fontSize: 30.0
          ),textAlign: TextAlign.center,

          ),
        ],
      ),
    );
  }
}
