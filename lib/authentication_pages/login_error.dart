import 'package:flutter/material.dart';


class LoginError extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Error !!"),
          elevation: 16.0,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.pop(context);
          }),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(child: Center(
                child: Text("Invalid Authentication Contact Customer Serivce for help:\n\n401-***-****",
                  style: TextStyle(color: Colors.red, fontSize: 30.0),)
            ),)
          ],
        )
    );
  }
}