import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:savvy_shopper/models/product.dart';

class CartModel extends ChangeNotifier {
  final List<Product> _products = [];

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  double get totalPrice {
    double total = 0;
    for (var product in _products) {
      total += product.price * product.quantity;
    }

    return total;
  }

  void add(Product product) {
    if (_products.contains(product)) {
      product.quantity++;
    } else {
      product.quantity++;
      _products.add(product);
    }

    notifyListeners();
  }

  void increaseProductQuantity(Product product) {
    product.quantity++;
    notifyListeners();
  }

  void decreaseProductQuantity(Product product) {
    product.quantity--;

    if (product.quantity == 0) {
      _products.remove(product);
    }

    notifyListeners();
  }

  void remove(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  void removeAll() {
    _products.clear();
    notifyListeners();
  }
}
