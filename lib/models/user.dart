import 'package:dilibro_boat/models/boat.dart';

class User{
  int id;
  String name;
  String email;
  String phone;
  Boat boat;

  User({this.name, this.email, this.phone, this.id});

  //Receives JSON Decode of Response.body to create a User
  User.fromMap(Map<String,dynamic> map){
    this.id = map['id'];
    this.name = map['name'];
    this.email = map['email'];
    this.phone = map['phone'];
  }

  User.addBoat(Boat boat){
    this.boat = boat;
  }

}