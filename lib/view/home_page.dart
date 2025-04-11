import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/widget/gridtile_product_item.dart';
import 'package:shop_demo/viewmodel/product_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showFav = false;

  @override
  Widget build(BuildContext context) {
    final productsDate = Provider.of<ProductsProvider>(context);
    final products = showFav? productsDate.favoriteProducts : productsDate.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (int selectedItem) {
              if (selectedItem == 0) setState(() {showFav = true;});
              if (selectedItem == 1) setState(() {showFav = false;});
            },
            itemBuilder: (_) {
              return [
                PopupMenuItem(value: 0, child: Text('Filter by favorite')),
                PopupMenuItem(value: 1, child: Text('All Products')),
              ];
            },
          ),
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/cart');
            }, icon: Icon(CupertinoIcons.cart)
          )
        ],
      ),
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
          return ChangeNotifierProvider.value(
            value: products[i],
            child: GridProductItem(),
          );
        },
      ),
    );
  }
}
