import 'package:savvy_shopper/models/product.dart';

class Products {
  final List<Product> products;

  Products({this.products});

  factory Products.fromJson(List<dynamic> json) {
    return Products(
      products: json != null
          ? List<Map<String, dynamic>>.from(json)
              .map((product) => Product.fromJson(product))
              .toList()
          : null,
    );
  }

  List<dynamic> toJson() {
    List<dynamic> json = <dynamic>[];
    if (products != null) {
      json = products;
    }

    return json;
  }
}
