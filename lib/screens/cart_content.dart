import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvy_shopper/components/cart/cart_list_item.dart';
import 'package:savvy_shopper/components/cart/checkout_bottom_bar.dart';
import 'package:savvy_shopper/components/green_elevated_button.dart';
import 'package:savvy_shopper/models/product.dart';
import 'package:savvy_shopper/models/provider/cart_model.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer<CartModel>(
            builder: (context, cart, child) {
              return ListView.builder(
                itemCount: cart.products.length,
                itemBuilder: (context, index) {
                  Product product = cart.products[index];
                  return CartListItem(
                    product: product,
                  );
                },
              );
            },
          ),
        ),
        CheckoutBottomBar(),
      ],
    );
  }
}
