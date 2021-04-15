import 'package:savvy_shopper/models/products.dart';
import 'package:savvy_shopper/networking/ApiProvider.dart';

class ProductRepository {
  ApiProvider _provider = ApiProvider();

  Future<Products> fetchProducts() async {
    final response = await _provider.get('/products');
    return Products.fromJson(response);
  }
}
