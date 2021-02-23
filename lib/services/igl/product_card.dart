import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String asset;
  final String item;
  final double price;
  final Function callBack;

  const ProductCard({Key key, this.asset, this.item, this.price, this.callBack}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        shadowColor: Colors.blueGrey,
        child:  Container(
            height: 350.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 300.0,
                  width: 350.0,
                  child: Image(
                    //Fills up whole container
                      fit: BoxFit.fill,
                      image: AssetImage(asset)),
              ),
              ListTile(
                onTap: () {
                  callBack(item, price);
                },
                leading: Icon(
                  Icons.add,
                  size: 30.0,
                  color: Colors.blueGrey[600],
                ),
                title: Text(
                  item,
                  style: TextStyle(fontSize: 22.0),
                  textAlign: TextAlign.left,
                ),
                subtitle: Text(
                  '\$$price',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
        ),
      );
  }
}
