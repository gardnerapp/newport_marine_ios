class Boat{
  String name;
  int length;
  String location;

  Boat(this.name, this.length, this.location);

  //Receives JSON Decode of Response.body to create aBoat
  Boat.fromMap(Map<String, dynamic> map) {
    this.name = map['name'];
    this.length = map['length'];
    this.location = map['location'];
  }
}