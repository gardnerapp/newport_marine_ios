import 'package:dilibro_boat/api/authentication_request.dart';
import 'package:dilibro_boat/forms/form_styles.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:flutter/material.dart';

import 'login_error.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  AuthenticationRequest auth = AuthenticationRequest();
  final _key = GlobalKey<FormState>();
  String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Reset'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        child: Center(
          child: Form(
            key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Please Follow The Instructions Sent To Your Email",
              style: TextStyle(
                fontSize: 20.0
              ),
              ),
              SizedBox(height: 35),
              Container(
                width: 400,
                child: TextFormField(
                  decoration: textInputDecoration("Email"),
                  onChanged: (val) => setState(() => email = val),
                ),
              ),SizedBox(height: 35),
              Container(
                  width: 400,
                  child: customRaisedIconButton(
                    Text(
                      "Submit",
                      style: raisedIconTextStyle(),
                    ),
                        iconDecoration(Icons.send),
                        () async {
                          if (_key.currentState.validate()) {
                            try {
                              var req = await auth.resetPassword(email);
                              if (req.statusCode == 202) {
                                Navigator.pop(context);
                              } else {
                                PushError();
                              }
                            } on Exception catch (e) {
                              print(e.toString());
                              PushError();
                            }
                          }
                        },
                  ))
            ],
          )),
        ),
      ),
    );
  }

  void PushError(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => LoginError()
    ));
  }
}
