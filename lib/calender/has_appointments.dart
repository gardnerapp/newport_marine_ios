import 'package:flutter/material.dart';

class HasAppointments extends StatelessWidget {
  final List<dynamic> data;

  const HasAppointments({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index){
                return AppointmentCard(
                  time: DateTime.parse(data[index]['time']),
                  title: data[index]['title'],
                  total: data[index]['total']
                );
        });
  }
}

class AppointmentCard extends StatelessWidget {
  final DateTime time;
  final String title;
  final double total;

  const AppointmentCard({Key key, this.time, this.title, this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${time.month}/${time.day}/${time.year} @ ${time.hour}:${time.minute}"),
      subtitle: Text("$title | \$$total"),
      onTap: (){},
    );
  }
}

