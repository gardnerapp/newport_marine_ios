import 'package:dilibro_boat/appointments/book_floating_action_button.dart';
import 'package:flutter/material.dart';

class BookAppointment extends StatefulWidget {
  final Function handleChange;

  const BookAppointment({Key key, this.handleChange}) : super(key: key);
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 07, minute: 00);
  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BookFloatingAction(iconData: Icons.calendar_today,
              onPressed: () {
                _selectDate(context);
                this.widget.handleChange(selectedDate);
              },),
            BookFloatingAction(iconData: Icons.timer,
                onPressed: () {
                  _selectTime(context);
                  this.widget.handleChange(selectedTime);
                })
          ],
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: "Select Appointment",
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(), // This will change to light theme.
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 7, minute: 15)
    );
    //TODO IF between acceptable range set Time ELSE display error
    setState(() {
      selectedTime = newTime;
    });
  }

}
