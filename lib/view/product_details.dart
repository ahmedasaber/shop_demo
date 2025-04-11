import 'package:flutter/material.dart';
import 'package:shop_demo/model/product_model.dart';

class ProductDetails extends StatelessWidget{
   ProductDetails({super.key, this.product});
   Product? product;

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)!.settings.arguments as Product;
    print(product);
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.asset(product!.image.toString(), fit: BoxFit.cover,),
            ),
            SizedBox(height: 20,),
            Text('\$${product!.price}', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(product!.description.toString()),
            )
          ],
        ),
      ),
    );
  }
}