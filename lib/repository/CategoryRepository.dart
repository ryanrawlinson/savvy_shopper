import 'package:savvy_shopper/models/categories.dart';
import 'package:savvy_shopper/networking/ApiProvider.dart';

class CategoryRepository {
  ApiProvider _provider = ApiProvider();

  Future<Categories> fetchCategories() async {
    final response = await _provider.get('/products/categories');
    return Categories.fromJson(response);
  }
}
