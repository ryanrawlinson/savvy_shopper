import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:savvy_shopper/models/product.dart';
import 'package:savvy_shopper/screens/arguments/ItemDetailsScreenArguments.dart';
import 'package:savvy_shopper/screens/item_details_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ItemDetailsScreen.routeName,
              arguments: ItemDetailsScreenArguments(product: product));
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Hero(
                    tag: 'product_image${product.id}',
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6, 0, 4),
                      child: Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 16.0, color: Colors.green.shade300),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
