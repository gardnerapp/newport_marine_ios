import 'package:dilibro_boat/models/user.dart';
import 'package:dilibro_boat/services/igl/product_card.dart';
import 'package:flutter/material.dart';

class ProductPageView extends StatefulWidget {
  final Function callBack;
  final User user;

  const ProductPageView({Key key, this.callBack, this.user}) : super(key: key);
  @override
  _ProductPageViewState createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  double ecoFabric;
  double ecoLeather;
  double ecoMarine;
  double ecoWindow;
  double ecoWood;

  // Boat Size and Price
  @override
  void initState() {
    var length = widget.user.boat.length;
    if(length < 35){
      ecoFabric = 112.48;
      ecoLeather = 99.95;
      ecoMarine = 812.50;
      ecoWindow = 91.19;
      ecoWood = 144.94;
    } else {
      ecoFabric = 874.94;
      ecoLeather = 99.95;
      ecoMarine = 812.50;
      ecoWood = 144.94;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ProductCard(
            asset: "lib/assets/img/igl/eco-fabric.jpg",
            item: "Eco Coat Fabric",
            price: ecoFabric,
            callBack: (String item, double price) => widget.callBack(item, price),
          ),
          ProductCard(
            asset: "lib/assets/img/igl/eco-leather.jpg",
            item: "Eco Coat Leather",
            price: ecoLeather,
            callBack: (String item, double price) => widget.callBack(item,price),
          ),
          ProductCard(
            asset: "lib/assets/img/igl/eco-marine.jpg",
            item: "Eco Coat Marine",
            price: ecoMarine,
            callBack: (String item, double price) => widget.callBack(item,price),
          ),
          ProductCard(
            asset: "lib/assets/img/igl/eco-window.jpg",
            item: "Eco Coat Window",
            price: ecoWindow,
            callBack: (String item, double price) => widget.callBack(item,price),
          ),
          ProductCard(
            asset: "lib/assets/img/igl/eco-wood.jpg",
            item: "Eco Coat Wood",
            price: ecoWood,
            callBack: (String item, double price) => widget.callBack(item,price),
          ),
        ],
      ),
    );
  }
}
