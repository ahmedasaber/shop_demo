import 'package:flutter/cupertino.dart';

import '../model/product_model.dart';

class ProductsProvider with ChangeNotifier{
  List<Product> _products = [
    Product(
      id: '1',
      title: 'Samsung',
      description: 'Samsung Galaxy smartphone with a stunning AMOLED display, powerful performance, and long-lasting battery life.',
      image: 'assets/images/Samsung-Galaxy.png',
      price: 1000,
    ),
    Product(
      id: '2',
      title: 'iPhone',
      description: 'Apple iPhone featuring an advanced A-series chip, high-quality dual camera system, and seamless iOS experience.',
      image: 'assets/images/iPhone.png',
      price: 1000,
    ),
    Product(
      id: '3',
      title: 'Watch',
      description: 'Elegant Apple Watch with fitness tracking, heart rate monitoring, and seamless integration with your Apple ecosystem.',
      image: 'assets/images/apple-watch.png',
      price: 1000,
    ),
  ];
  List<Product> get products => _products;

  List<Product> get favoriteProducts{
    return _products.where((product)=>product.isFavorite).toList();
  }
}