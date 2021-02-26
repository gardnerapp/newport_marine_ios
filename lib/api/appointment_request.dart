import 'dart:convert';

import 'base_api.dart';
import 'package:http/http.dart' as http;

//Setting Appointments & Getting a Users Appointments

class AppointmentRequest extends BaseAPI {
  Future<http.Response> createAppointment(String title, String time, double cost, int userId,
      Map<String, double> services, String token) async {
    var body = jsonEncode({
      'appointment': {
        'time': time,
        'title': title,
        'total': cost,
        'user_id': userId,
        'services': services
      },

    });

    http.Response response =
        await http.post("http://localhost:3000/api/appointment", headers: headers, body: body);
    return response;
  }
}