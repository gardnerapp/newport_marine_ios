import 'package:flutter/material.dart';


class CreateUserErrorPage extends StatelessWidget {
//TODO Tidy up borth Error Pages
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
            child: Text("Couldn't Create User If this continues to be an issue please contact our customer service\n\n401-***-****",
              style: TextStyle(color: Colors.red, fontSize: 30.0),)
          ),)
        ],
      )
    );
  }
}
