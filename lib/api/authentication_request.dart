import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_api.dart';

//Authentication, creating users, & boats

class AuthenticationRequest extends BaseAPI{

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

    http.Response response =
        await http.post(super.createUserPath, headers: headers, body: body);
    return response;
  }

  Future<http.Response> createBoat(int userId, String token, String boatName,
      double boatLength, String location) async {
    var body = jsonEncode({
      'id': userId,
      'token': token,
      'boat': {'name': boatName, 'location': location, 'length': boatLength}
    });

    http.Response response =
        await http.post(createBoatPath, headers: headers, body: body);

    return response;
  }

  Future<http.Response> login(String phone, String password) async {
    var body = jsonEncode({
      'user': {'phone': phone, 'password': password}
    });

    http.Response response =
        await http.post(loginPath, headers: headers, body: body);
    return response;
  }

  Future<http.Response> resetPassword(String email) async {
    var body = jsonEncode({
      'password_reset': {'email': email}
    });

    http.Response response =
        await http.post(resetPasswordPath, headers: headers, body: body);
    return response;
  }
}