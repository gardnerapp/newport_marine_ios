import 'package:flutter/material.dart';

class Receipt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text("Standard Wash:", style: receiptRowStyle().copyWith(fontSize: 20.0), textAlign: TextAlign.left,),
          SizedBox(height: 20.0),
          ReceiptRow(message: "200ft * 16.0\\ft ", price: 400.00, ),
          Text("Standard Wash:", style: receiptRowStyle().copyWith(fontSize: 20.0), textAlign: TextAlign.left,),
          SizedBox(height: 20.0),
          ReceiptRow(message: "200ft * 16.0\\ft ",price: 400.00, ),
          Text("Standard Wash:", style: receiptRowStyle().copyWith(fontSize: 20.0), textAlign: TextAlign.left,),
          SizedBox(height: 20.0),
          ReceiptRow(message: "200ft * 16.0\\ft ",price: 400.00, ),
          SizedBox(height: 20.0),
          Divider(height: 5.0, color: Colors.black87,),
          SizedBox(height: 20.0),
         ReceiptRow(message: "Total:",price: 5000.00, ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class ReceiptRow extends StatelessWidget {
  final String message;
  final double price;

  const ReceiptRow({Key key, this.message, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(message, style: receiptRowStyle(),), Text("\$ $price", style: receiptRowStyle(),)
      ],
    );
  }

}

TextStyle receiptRowStyle(){
  return TextStyle(
      color: Colors.black87,
      fontSize: 20.0
  );
}
