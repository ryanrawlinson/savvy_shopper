import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvy_shopper/components/green_elevated_button.dart';
import 'package:savvy_shopper/models/product.dart';
import 'package:savvy_shopper/models/provider/cart_model.dart';
import 'package:savvy_shopper/screens/arguments/ItemDetailsScreenArguments.dart';

class ItemDetailsScreen extends StatelessWidget {
  static const routeName = '/itemDetails';

  @override
  Widget build(BuildContext context) {
    final ItemDetailsScreenArguments arguments =
        ModalRoute.of(context).settings.arguments as ItemDetailsScreenArguments;

    void addItemToCart(Product product) {
      Provider.of<CartModel>(context, listen: false).add(product);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Image.asset('images/icon_favorite.png'),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Flexible(
                flex: 9,
                child: Container(
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Hero(
                            tag: 'product_image${arguments.product.id}',
                            child: CachedNetworkImage(
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                imageUrl: arguments.product.image),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 42.0),
                                child: Text(
                                  arguments.product.title,
                                  style: TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 18.0),
                                child: Text(
                                  'Details',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ),
                              Text(arguments.product.description)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: .1))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PRICE',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                                Text(
                                  '\$${arguments.product.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: GreenElevatedButton(
                              buttonText: 'ADD',
                              onClick: () {
                                addItemToCart(arguments.product);
                                print(
                                  Provider.of<CartModel>(context, listen: false)
                                      .products
                                      .map(
                                        (e) => e.toJson().toString(),
                                      ),
                                );

                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
