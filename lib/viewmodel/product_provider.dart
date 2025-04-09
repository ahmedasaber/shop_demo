import 'package:flutter/cupertino.dart';

import '../model/product_model.dart';

class ProductsProvider with ChangeNotifier{
  List<Product> _products = [
    Product(
      id: '1',
      title: 'Samsung',
      description: 'description',
      image: 'assets/images/Samsung-Galaxy.png',
      price: 1000,
    ),
    Product(
      id: '2',
      title: 'Iphone',
      description: 'description',
      image: 'assets/images/iPhone.png',
      price: 1000,
    ),
    Product(
      id: '3',
      title: 'Watch',
      description: 'description',
      image: 'assets/images/apple-watch.png',
      price: 1000,
    ),
  ];
  List<Product> get products => _products;

  toggleIsFav(Product? p){
    p!.isFavorite = !p.isFavorite;
    notifyListeners();
  }
}