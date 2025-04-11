import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/card_model.dart';
import '../model/product_model.dart';

class GridProductItem extends StatelessWidget {
  //final Product? product;

  const GridProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    var pProduct = Provider.of<Product>(context, listen: false);
    var cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        footer: GridTileBar(
          title: Text(
            pProduct.title.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
          backgroundColor: Colors.black45,
          leading: Consumer<Product>(
            builder: (context, pProduct, child) {
              return IconButton(
                onPressed: () {
                  pProduct.toggleIsFav();
                },
                icon: pProduct.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
              );
            },
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(productId: pProduct.id!, title: pProduct.title,price: pProduct.price.toString());
            },
            icon: Icon(Icons.add_shopping_cart),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
               '/productDetails',
              arguments: pProduct,
            );
          },
          child: Image.asset(pProduct.image.toString()),
        ),
      ),
    );
  }
}
