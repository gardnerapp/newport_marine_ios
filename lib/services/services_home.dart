import 'package:dilibro_boat/calender/route_to_calender.dart';
import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/dockside/dockside.dart';
import 'package:dilibro_boat/services/full_detail/full_detail.dart';
import 'package:dilibro_boat/services/igl/igl.dart';
import 'package:dilibro_boat/services/service_tile.dart';
import 'package:dilibro_boat/services/services_home_drawer.dart';
import 'package:dilibro_boat/services/wash/wash_page.dart';
import 'package:flutter/material.dart';

class ServicesHome extends StatelessWidget {
  final User user;


  const ServicesHome({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        elevation: 16.0,
        title: Text(
          "Our Services",
        ),
        actions: <Widget>[
          RouteCalender(
            userId: user.id,
            token: user.token,
          )
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
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FullDetail(
              user: user,
            ))),
          ),
          //ceramics
          //dockSide
          ServicesTile(
            asset: "lib/assets/img/dock_side.jpeg",
            title: "Dock Side",
            subTitle: "Arrival/Departure Services & Supply Restock",
            icon: Icons.thumb_up,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DockSide(
              user: user,
            ))),
          ),
        ],
      )),
    );
  }
}
