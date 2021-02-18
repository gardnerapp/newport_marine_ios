import 'package:dilibro_boat/services/wash/wash_page.dart';
import 'package:flutter/material.dart';


//col, => pic => listitle => service description, service
class ServicesTile extends StatelessWidget {
  final String asset;
  final String title;
  final String subTitle;
  final IconData icon;
  final Function onTap;

  const ServicesTile(
      {Key key,
      this.asset,
      this.title,
      this.subTitle,
      this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        shadowColor: Colors.blueGrey,
        child: InkWell(
          splashColor: Colors.blueGrey,
          onTap: onTap,
          child: Container(
            height: 350.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200.0,
                  width: 300.0,
                  child: Image(
                    //Fills up whole container
                      fit: BoxFit.fill,
                      image: AssetImage(asset)),
                ),
                ListTile(
                  leading: Icon(icon, size: 30.0, color: Colors.blueGrey[600],),
                  title: Text(title, style: TextStyle(fontSize: 22.0), textAlign: TextAlign.left,),
                  subtitle: Text(subTitle, style: TextStyle(fontSize: 16.0), textAlign: TextAlign.left,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
