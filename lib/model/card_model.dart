import 'package:flutter/material.dart';

class CardItem {
  final String? id;
  final String? title;
  final String? price;
  final int quantity;

  CardItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CardItem> _items = {};

  Map<String, CardItem> get items {
    return {..._items};
  }

  void addItem({required String productId, String? title, String? price}) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (value) => CardItem(
          id: value.id,
          title: value.title,
          price: value.price,
          quantity: value.quantity + 1,
        ),
      );
      notifyListeners();
    }else{
      _items.putIfAbsent(productId, ()=>CardItem(
        id: DateTime.now().toString(),
        title: title.toString(),
        price: price.toString(),
        quantity:1,
      ));
      notifyListeners();
    }
  }

  double get totalToPay{
    double total = 0.0;
    _items.forEach((key,value){
      total += double.parse(value.price!) * value.quantity;
    });
    return total;
  }

  void removeItem(String? productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
