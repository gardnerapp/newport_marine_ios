import 'dart:convert';
import 'package:dilibro_boat/models/boat.dart';
import 'package:http/http.dart' as http;
import 'base_api.dart';

class AuthenticationRequest extends BaseAPI{
  //Create New User method
  //Login method
  //Add Boat
  //logout

  Future<http.Response> createUser(String name, String email, String phone,
      String password, String passwordConfirmation) async {
    var body = jsonEncode({
      'user': {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": passwordConfirmation
      }
    });

    http.Response response = await http.post("http://localhost:3000/api/users", headers: headers, body: body);
    return response;
  }

  Future<http.Response> login(String phone, String password) async {
    var body = jsonEncode({
     'phone': phone, 'password': password
    });

    http.Response response = await http.post("http://localhost:3000/api/login", headers: headers, body: body);
    return response;
  }

  Future<http.Response> createBoat(
      int userId, String boatName, double boatLength, String location) async {
    var body = jsonEncode({
      'id': userId,
      'boat': {'name': boatName, 'location': location, 'length': boatLength}
    });

    http.Response response = await http.post("http://localhost:3000/api/boats/", headers: headers, body: body);

    return response;
  }


}