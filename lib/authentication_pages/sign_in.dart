import 'dart:convert';
import 'package:dilibro_boat/api/authentication_request.dart';
import 'package:dilibro_boat/authentication_pages/login_error.dart';
import 'package:dilibro_boat/authentication_pages/reset_password.dart';
import 'package:dilibro_boat/forms/form_styles.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/services_home.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthenticationRequest auth = AuthenticationRequest();
  final _key =  GlobalKey<FormState>();
  String phone;
  String password;
  @override
  Widget build(BuildContext context) {
    print(auth.loginPath);
    print(auth.resetPasswordPath);
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
      child: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 70),
            Text("Sign In", style: formTitleStyle(),),
            SizedBox(height: 30),
            Container(
              width: 400,
              child: TextFormField(
                decoration: textInputDecoration("Phone"),
                onChanged: (val) => setState(() => phone = val),
              )
            ),
            SizedBox(height: 30),
            Container(
              width: 400,
              child: TextFormField(
                obscureText: true,
                decoration: textInputDecoration("Password"),
                onChanged: (val) => setState(() => password = val),
              ),
            ),
            SizedBox(height: 25),
            GestureDetector(
              child: Text("Forgot Password ?", style: TextStyle(
                fontSize: 18.0,
                decoration: TextDecoration.underline
              ),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));
              },
            ),
            SizedBox(height: 25),
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
                            var req = await auth.login(phone, password);
                            if (req.statusCode == 202) {
                              User user = User.fromLogin(jsonDecode(req.body));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ServicesHome(user: user)));
                            } else {

                              PushError();
                            }
                          } on Exception catch (e) {
                            print(e.toString());
                            PushError();
                          }
                        }
                      },
                )),
          ],
        )
      )
    );
  }

  void PushError(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => LoginError()
    ));
  }

}
