import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/viewmodel/product_provider.dart';
import 'model/product_model.dart';

class GridProductItem extends StatelessWidget{
  //final String? id,title,image;
  final Product? product;
  const GridProductItem({super.key, this.product});


  @override
  Widget build(BuildContext context) {
    var pProduct = Provider.of<ProductsProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        footer: GridTileBar(
          title: Text(product!.title.toString(), textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),
          backgroundColor: Colors.black45,
          leading: IconButton(
            onPressed: (){
              pProduct.toggleIsFav(product);
            },
            icon: product!.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border)
          ),
          trailing: IconButton(
              onPressed: (){},
              icon: Icon(Icons.add_shopping_cart)
          ),
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/productDetails', arguments: product);
          },
          child: Image.asset(product!.image.toString())
        ),
      ),
    );
  }

}