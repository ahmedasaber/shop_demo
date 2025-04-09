import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridProductItem extends StatelessWidget{
  final String? id,title,image;
  const GridProductItem({super.key, required this.id, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        title: Text(title.toString(), textAlign: TextAlign.center,),
        backgroundColor: Colors.black45,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.favorite_border)
        ),
        trailing: IconButton(
            onPressed: (){},
            icon: Icon(Icons.add_shopping_cart)
        ),
      ),
      child: Image.asset(image.toString()),
    );
  }

}