import 'dart:convert';

import 'base_api.dart';
import 'package:http/http.dart' as http;

//Setting Appointments & Getting a Users Appointments

class AppointmentRequest extends BaseAPI {
  Future<http.Response> createAppointment(String title,
      String time,
      double total,
      int userId,
      String additionalInstructions,
      Map<String, double> services,
      String token) async {
    var body = jsonEncode({
      'appointment': {
        'time': time,
        'title': title,
        'total': total,
        'user_id': userId,
        'additional_instructions': additionalInstructions,
        'services': jsonEncode(services)
      },
      'token': token
    });

    http.Response response =
    await http.post(createAppointmentPath, headers: headers, body: body);
    return response;
  }

  Future<http.Response> getUserAppointments(int userId,
      String token) async {
    //Todo how to send get w params
    var body = jsonEncode({
      'id': userId,
      'token': token
    });

    http.Response response = await http.get(userAppointmentsIndex, headers: headers);

    return response;
  }

}

