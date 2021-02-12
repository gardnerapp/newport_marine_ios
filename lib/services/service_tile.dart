import 'package:dilibro_boat/services/wash/wash_page.dart';
import 'package:flutter/material.dart';


//col, => pic => listitle => service description, service
class ServicesTile extends StatelessWidget {
  final String asset;
  final String title;
  final String subTitle;
  final IconData icon;

  const ServicesTile({Key key, this.asset, this.title, this.subTitle, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      shadowColor: Colors.blueGrey,
      child: InkWell(
        splashColor: Colors.blueGrey,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => WashPage()));
        },
        child: Container(
          height: 350.0,
          padding: EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
