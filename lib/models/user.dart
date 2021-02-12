class User{
  int id;
  String name;
  String email;
  String phone;
  //TODO Boats

  User({this.name, this.email, this.phone, this.id});

  //Receives JSON Decode of Response.body to create a User
  User.fromMap(Map<String,dynamic> map){
    this.id = map['id'];
    this.name = map['name'];
    this.email = map['email'];
    this.phone = map['phone'];
  }

}