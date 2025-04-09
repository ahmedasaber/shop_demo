import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/gridtile_product_item.dart';
import 'package:shop_demo/model/product_model.dart';
import 'package:shop_demo/viewmodel/product_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context).products;
    return Scaffold(
      appBar: AppBar(title: Text('Products'),),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        addRepaintBoundaries: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 30,
        ),
        itemCount: products.length,
        itemBuilder: (context, i) {
          return GridProductItem(product: products[i]);
        },
      ),
    );
  }
}
