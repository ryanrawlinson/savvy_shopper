import 'package:savvy_shopper/models/product.dart';

class CategoryScreenArguments {
  final String categoryName;
  final List<Product> products;

  CategoryScreenArguments({this.categoryName, this.products});
}
