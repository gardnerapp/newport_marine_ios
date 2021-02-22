import 'package:dilibro_boat/models/user.dart';
import 'package:flutter/material.dart';

class DockSide extends StatefulWidget {
  final User user;

  const DockSide({Key key, this.user}) : super(key: key);
  @override
  _DockSideState createState() => _DockSideState();
}

class _DockSideState extends State<DockSide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dock Side"),
      ),
    );
  }
}
