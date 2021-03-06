import 'package:dilibro_boat/models/boat.dart';

class User{
  int id;
  String name;
  String email;
  String phone;
  Boat boat;
  String token;

  User({this.name, this.email, this.phone, this.id, this.boat, this.token});

  //Receives JSON Decode of Response.body to create a User
  User.fromMap(Map<String,dynamic> map){
    this.id = map['id'];
    this.name = map['name'];
    this.email = map['email'];
    this.phone = map['phone'];
    this.token = map['token'];
  }

  User.addBoat(Boat boat){
    this.boat = boat;
  }

  User.fromLogin(Map<String,dynamic> map){
    this.id = map['id'];
    this.name = map['name'];
    this.email = map['email'];
    this.phone = map['phone'];
    this.token = map['token'];
    this.boat = Boat.fromMap(map['boat']);
  }

}