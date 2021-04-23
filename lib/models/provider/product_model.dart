import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:savvy_shopper/models/product.dart';

class ProductModel extends ChangeNotifier {
  List<Product> _products = [];

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  void updateProducts(List<Product> products) {
    _products.clear();
    _products = products;

    notifyListeners();
  }
}
