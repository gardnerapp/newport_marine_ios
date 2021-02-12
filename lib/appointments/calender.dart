
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flutter/material.dart';

class Calender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CalendarDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime(2020, 01,01),
          lastDate: DateTime(2022, 01,01,),
          onDateChanged: null ),
    );
  }
}

