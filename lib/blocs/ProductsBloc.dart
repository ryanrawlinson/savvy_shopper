import 'dart:async';

import 'package:savvy_shopper/models/products.dart';
import 'package:savvy_shopper/networking/Response.dart';
import 'package:savvy_shopper/repository/ProductRepository.dart';

class ProductsBloc {
  ProductRepository _productRepository;
  StreamController _productListController;

  StreamSink<Response<Products>> get productSink => _productListController.sink;

  Stream<Response<Products>> get productsStream =>
      _productListController.stream;

  ProductsBloc() {
    _productListController = StreamController<Response<Products>>();
    _productRepository = ProductRepository();

    _fetchProducts();
  }

  _fetchProducts() async {
    productSink.add(Response.loading("Getting products..."));

    try {
      Products products = await _productRepository.fetchProducts();
      productSink.add(Response.complete(products));
    } catch (e) {
      productSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  void dispose() {
    _productListController.close();
  }
}
