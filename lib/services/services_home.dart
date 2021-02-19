import 'package:dilibro_boat/app_bar_styling.dart';
import 'package:dilibro_boat/calender/route_to_calender.dart';
import 'package:dilibro_boat/forms/raised_icon_style.dart';
import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/full_detail/full_detail.dart';
import 'package:dilibro_boat/services/igl/igl.dart';
import 'package:dilibro_boat/services/service_tile.dart';
import 'package:dilibro_boat/services/wash/wash_page.dart';
import 'package:flutter/material.dart';


class ServicesHome extends StatelessWidget {
  final User user;

  const ServicesHome({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 16.0,
        title: Text(
          "Our Services",
        ),
        actions: <Widget>[
           RouteCalender()
        ],
      ),
      body: Container(
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
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WashPage(
                            user: user,
                          )))),
          //Full Detail
          ServicesTile(
            asset: "lib/assets/img/full_detail.jpg",
            title: "Full Detailing",
            subTitle: "Everything You Need & More !",
            icon: Icons.wb_sunny,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FullDetail())),
          ),
          //ceramics
          ServicesTile(
            asset: "lib/assets/img/ceramics.jpeg",
            title: "IGL Ceramics Application",
            subTitle: "Oxidation Removal + Compounding & Polishing ",
            icon: Icons.colorize,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => IGLHome())),
          ),
          //dockSide
          ServicesTile(
            asset: "lib/assets/img/dock_side.jpeg",
            title: "Dock Side",
            subTitle: "Arrival/Departure Services & Supply Restock",
            icon: Icons.thumb_up,
            onTap: (){},
          ),
        ],
      )),
    );
  }
}

/*
*  Container(
                  height: 100.0,
                  child: Image(image: AssetImage("lib/assets/img/newport_marine_logo.jpg"))),
*  */