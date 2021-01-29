import 'package:dilibro_boat/services/services_home.dart';
import 'package:dilibro_boat/services/washes.dart';
import 'package:flutter/material.dart';

//todo start drawer

class ServicePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(children: <Widget>[
      ServicesHome(),
      Washes(),
    ],

    );
  }
}


