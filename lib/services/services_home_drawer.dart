import 'package:dilibro_boat/authentication_pages/auth.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Container(
                child: Image(
                    image:
                        AssetImage("lib/assets/img/newport_marine_logo.jpg"))),
            SizedBox(height: 45),
            Text(
              "Thank You For Choosing Newport Marine Detailing",
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 45),
            Text(
              "If you need to change your appointment please contact customer service: tech_support@newportmarine.app ",
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 45),
            Text(
              "Any Bugs can be reported here:\n https://host/bugs.com",
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 45.0),
            GestureDetector(
              child: Text("Logout", style: TextStyle(
                  fontSize: 18.0,
                  decoration: TextDecoration.underline
              ),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Auth()));
              },
            ),
          ]),
    );
  }
}
