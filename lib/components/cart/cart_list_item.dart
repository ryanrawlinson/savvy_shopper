import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvy_shopper/models/product.dart';
import 'package:savvy_shopper/models/provider/cart_model.dart';

class CartListItem extends StatelessWidget {
  final Product product;

  CartListItem({
    @required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id.toString()),
      background: Container(
        color: Colors.red,
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      onDismissed: (direction) {
        Provider.of<CartModel>(context, listen: false).remove(product);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Removed ${product.title}')));
      },
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: product.image,
          height: 65,
          width: 65,
          placeholder: (context, url) => CircularProgressIndicator(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              product.price.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.green.shade300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                        .increaseProductQuantity(product);
                  },
                ),
                Text(product.quantity.toString()),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                        .decreaseProductQuantity(product);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
