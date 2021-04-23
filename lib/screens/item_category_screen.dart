import 'package:flutter/material.dart';
import 'package:savvy_shopper/components/explore/products_grid.dart';
import 'package:savvy_shopper/screens/arguments/CategoryScreenArguments.dart';

import '../utilities/extensions.dart';

class ItemCategoryScreen extends StatelessWidget {
  static const routeName = '/category';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as CategoryScreenArguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          arguments.categoryName.toTitleCase(),
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Image.asset('images/action_search.png'),
        ],
      ),
      body: ProductsGrid(products: arguments.products),
    );
  }
}
