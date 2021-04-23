import 'package:flutter/material.dart';
import 'package:savvy_shopper/components/explore/product_card.dart';
import 'package:savvy_shopper/models/product.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> products;

  ProductsGrid({this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: .7,
      children: List.generate(products.length, (index) {
        return ProductCard(
          product: products[index],
        );
      }),
    );
  }
}
