import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/model/card_model.dart';

class CartItemTile extends StatelessWidget{
  const CartItemTile({super.key, required this.id, required this.title, required this.productId, required this.price, required this.quantity});

  final String? id;
  final String? title;
  final String? productId;
  final String? price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: ListTile(
        leading: Text(price.toString()),
        title: Text(title.toString()),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("x${quantity.toString()}"),
            Text('\$${double.parse(price.toString())*quantity}'),
          ],
        ),
        trailing: IconButton(
          onPressed: (){
            Provider.of<Cart>(context, listen: false).removeItem(productId);
          },
          icon: Icon(CupertinoIcons.delete)
        ),
      ),
    );
  }

}