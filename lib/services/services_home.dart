import 'package:dilibro_boat/services/service_tile.dart';
import 'package:flutter/material.dart';

//Wash
//Full Detail
//Ceramics
//DockSide


class ServicesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      padding: EdgeInsets.all(30.0),
      shrinkWrap: true,
      children: <Widget>[
        Image(image: AssetImage("lib/assets/img/full_logo.png")),
        // wash
        ServicesTile(
          asset: "lib/assets/img/wash.jpg",
          title: "Daily & Weekly Washes",
          subTitle: "Discount Rates for Weekly & Biweekly plans",
          icon: Icons.update,
        ),
        //Full Detail
        ServicesTile(
          asset: "lib/assets/img/full_detail.jpg",
          title: "Full Detailing",
          subTitle: "Everything You Need & More !",
          icon: Icons.wb_sunny,
        ),
        //ceramics
        ServicesTile(
          asset: "lib/assets/img/ceramics.jpeg",
          title: "IGL Ceramics Application",
          subTitle: "Oxidation Removal + Compounding & Polishing ",
          icon: Icons.colorize,
        ),
        //dockSide
        ServicesTile(
          asset: "lib/assets/img/dock_side.jpeg",
          title: "Dock Side",
          subTitle: "Arrival/Departure Services & Supply Restock",
          icon: Icons.thumb_up,
        ),
      ],
    ));
  }
}

/*
*  Container(
                  height: 100.0,
                  child: Image(image: AssetImage("lib/assets/img/newport_marine_logo.jpg"))),
*  */