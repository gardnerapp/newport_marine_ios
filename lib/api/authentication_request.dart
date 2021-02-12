import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_api.dart';

class AuthenticationRequest extends BaseAPI{
  //Create New User method
  //Login method
  //Add Boat
  //logout


  //TODO Properly use parent shit


  Future<http.Response> createUser(String name, String email, String phone,
      String password, String passwordConfirmation
      ) async {
    var body = jsonEncode({
          "name": name,
          "email": email,
          "phone": phone,
          "password_digest": password,
          "password_confirmation": passwordConfirmation
        });

    http.Response response = await http.post("http://localhost:3000/api/users", headers: headers, body: body);
    //Don't return Response return JSON
    print(response.toString());
    print("body");
    print(response.body);
    print(response.statusCode.toString());
    print("\n\n end of create");
    return response;
  }

  Future<http.Response> login(String phone, String password) async {

    var body = jsonEncode({
      'phone': phone,
      'password': password
    });

    http.Response response = await http.post("http://localhost:300/api/login", headers: headers, body: body);
    print(response.toString());
    print(response.body);
    print(response.statusCode.toString());
    print("\n\n end of Login");
    return response;
  }


}