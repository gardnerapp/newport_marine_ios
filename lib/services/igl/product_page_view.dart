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
//Todo fix prices, dynamic rendering based on boat length
class _ProductPageViewState extends State<ProductPageView> {

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
            price: 112.44,
            callBack: (String item, double price) => widget.callBack(item, price),
          ),
          ProductCard(
            asset: "lib/assets/img/igl/eco-leather.jpg",
            item: "Eco Coat Leather",
            price: 112.44,
            callBack: (String item, double price) => widget.callBack(item,price),
          ),
          ProductCard(
            asset: "lib/assets/img/igl/eco-marine.jpg",
            item: "Eco Coat Marine",
            price: 112.44,
            callBack: (String item, double price) => widget.callBack(item,price),
          ),
          ProductCard(
            asset: "lib/assets/img/igl/eco-window.jpg",
            item: "Eco Coat Window",
            price: 112.44,
            callBack: (String item, double price) => widget.callBack(item,price),
          ),
          ProductCard(
            asset: "lib/assets/img/igl/eco-wood.jpg",
            item: "Eco Coat Wood",
            price: 112.44,
            callBack: (String item, double price) => widget.callBack(item,price),
          ),
        ],
      ),
    );
  }
}
