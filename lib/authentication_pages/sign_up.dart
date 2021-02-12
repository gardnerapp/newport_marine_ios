import 'dart:convert';

import 'package:dilibro_boat/api/authentication_request.dart';
import 'package:dilibro_boat/api/error.dart';
import 'package:dilibro_boat/forms/create_boat.dart';
import 'package:dilibro_boat/forms/form_styles.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/models/user.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

//TODO Strong password Sanitization

class _SignUpState extends State<SignUp> {
  AuthenticationRequest auth = AuthenticationRequest();
  final _key = GlobalKey<FormState>();
  String name;
  String email;
  String phone;
  String password;
  String passwordConfirmation;
  static Pattern emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp emailRegex = new RegExp(emailPattern);
  static Pattern phonePattern = r'^(?:[+0]9)?[0-9]{10}$';
  RegExp phoneRegex = new RegExp(phonePattern);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Create Your Account", style: formTitleStyle(),),
              Container(
                width: 400,
                child: TextFormField(
                  decoration: textInputDecoration("Name"),
                  onChanged: (val){
                    setState(() {
                      name = val;
                    });
                  },
                  validator: (val) => val.isEmpty ? "Please enter your name" : null,
                )
              ),
              Container(
                  width: 400,
                  child: TextFormField(
                    decoration: textInputDecoration("Email"),
                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                    },
                    validator: (val){
                      if(val.isEmpty){
                        return "You Forgot to enter your email";
                      }
                      else if(!emailRegex.hasMatch(val)){
                        return "Your did not enter a valid email address";
                      }
                      return null;
                    }
                  )
              ),
              Container(
                  width: 400,
                  child: TextFormField(
                    decoration: textInputDecoration("Phone"),
                    onChanged: (val){
                      setState(() {
                        phone = val;
                      });
                    },
                    validator: (val){
                      if(val.isEmpty){
                        return "You Forgot to enter your email";
                      }
                      else if(!phoneRegex.hasMatch(val)){
                        return "Your did not enter a valid phone number, ommit - & ()";
                      }
                      return null;
                    }
                  )
              ),
              Container(
                  width: 400,
                  child: TextFormField(
                    obscureText: true,
                    decoration: textInputDecoration("Password"),
                    onChanged: (val){
                      setState(() {
                        password = val;
                      });
                    },
                    validator: (val){
                      if(val.isEmpty){
                        return "You forgot to enter a password";
                      }
                      else if (val.length < 6){
                        return "Password must be 6 characters long";
                      }
                      else if (val == "password"){
                        return "That's definitely not a good password choice";
                      }
                      return null;
                    }
                  )
              ),
              Container(
                  width: 400,
                  child: TextFormField(
                    obscureText: true,
                    decoration: textInputDecoration("Password Confirmation"),
                    onChanged: (val){
                      setState(() {
                        passwordConfirmation = val;
                      });
                    },
                    validator: (val) => val != password ? "Your Passwords Don't Match" : null,
                  )
              ),
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
                          var req = await auth.createUser(name, email, phone, password, passwordConfirmation);
                          if (req.statusCode == 200) {
                            User user = User.fromMap(jsonDecode(req.body));
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => CreateBoat(user: user,))
                            );
                          }else{
                            PushError();
                          }
                        } on Exception catch (e) {
                          PushError();
                        }
                        
                        //Detect Json Errors and status code errors
                        //And then route properly
                          
                      }
                    },
                  ))
            ],
          ),
        ) );
  }

  void PushError(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => CreateUserErrorPage()
    ));
  }

}