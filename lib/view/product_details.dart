import 'package:flutter/material.dart';
import 'package:shop_demo/model/product_model.dart';

class ProductDetails extends StatelessWidget{
   ProductDetails({super.key, this.product});
   late Product? product;

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)!.settings.arguments as Product;
    print(product);
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: Center(child: Text(product!.title.toString()),),
    );
  }
}