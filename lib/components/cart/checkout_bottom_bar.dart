import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvy_shopper/models/provider/cart_model.dart';

import '../green_elevated_button.dart';

class CheckoutBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  Provider.of<CartModel>(context).totalPrice.toStringAsFixed(2),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.green.shade300,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GreenElevatedButton(
                  buttonText: 'CHECKOUT',
                  onClick: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
