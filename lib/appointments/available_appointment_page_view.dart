import 'package:dilibro_boat/appointments/available_appointment_list.dart';
import 'package:flutter/material.dart';

import '../app_details.dart';

class AppointmentPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        AppDetails(),
        AvailableAppointmentList(),
        AvailableAppointmentList(),
        AvailableAppointmentList(),
      ],
    );
  }
}
