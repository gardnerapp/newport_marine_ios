
import 'package:flutter/material.dart';

import 'book_floating_action_button.dart';

class BookAppointment extends StatefulWidget {
  final Function handleDateChange;
  final Function handleTimeChange;

  const BookAppointment({Key key, this.handleDateChange, this.handleTimeChange}) : super(key: key);
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BookFloatingAction(iconData: Icons.calendar_today,
              heroTag: "Date",
              onPressed: () async {
                await _selectDate(context);
                this.widget.handleDateChange(selectedDate);
              },),
            BookFloatingAction(iconData: Icons.timer,
                heroTag: "Time",
                onPressed: () async {
                  await _selectTime(context);
                  this.widget.handleTimeChange(selectedTime);
                })
          ],
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2021, DateTime.september, 01),
      helpText: "When Would You Like To Book Your Appointment",
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(), // This will change to light theme.
          child: child,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        print(selectedDate);
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 7, minute: 15)
    );
    
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
    }
  }

}
