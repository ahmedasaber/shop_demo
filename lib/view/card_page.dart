import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/card_model.dart';

class CartScreen extends StatelessWidget{
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    print(cart.items);
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart'),),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total'),
                  Spacer(),
                  Chip(label: Text('${cart.totalToPay} \$')),
                  TextButton(onPressed: (){}, child: Text('order now'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}