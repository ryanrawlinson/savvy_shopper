import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvy_shopper/components/cart/cart_list_item.dart';
import 'package:savvy_shopper/components/cart/checkout_bottom_bar.dart';
import 'package:savvy_shopper/models/product.dart';
import 'package:savvy_shopper/models/provider/cart_model.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  Widget _displayCartContent(CartModel cartModel) {
    if (cartModel.products.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
            size: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your cart is empty! \nGo buy stuff!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )
        ],
      );
    }

    return ListView.builder(
      itemCount: cartModel.products.length,
      itemBuilder: (context, index) {
        Product product = cartModel.products[index];
        return CartListItem(
          product: product,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer<CartModel>(
            builder: (context, cart, child) {
              return _displayCartContent(cart);
            },
          ),
        ),
        CheckoutBottomBar(),
      ],
    );
  }
}
