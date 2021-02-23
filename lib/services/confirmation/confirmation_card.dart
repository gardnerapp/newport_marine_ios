import 'package:flutter/material.dart';

class ConfirmationCard extends StatelessWidget {
  final List<Widget> children;

  const ConfirmationCard({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 8.0,
        shadowColor: Colors.blueGrey,
        child: ListView(shrinkWrap: true, children: children),
      ),
    ));
  }
}
