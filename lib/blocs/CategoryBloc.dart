import 'dart:async';

import 'package:savvy_shopper/models/categories.dart';
import 'package:savvy_shopper/networking/Response.dart';
import 'package:savvy_shopper/repository/CategoryRepository.dart';

class CategoryBloc {
  CategoryRepository _categoryRepository;
  StreamController _categoryListController;

  StreamSink<Response<Categories>> get categorySink =>
      _categoryListController.sink;

  Stream<Response<Categories>> get categoryStream =>
      _categoryListController.stream;

  CategoryBloc() {
    _categoryListController = StreamController<Response<Categories>>();
    _categoryRepository = CategoryRepository();

    _fetchCategories();
  }

  _fetchCategories() async {
    categorySink.add(Response.loading("Getting categories..."));

    try {
      Categories categories = await _categoryRepository.fetchCategories();
      categorySink.add(Response.complete(categories));
    } catch (e) {
      categorySink.add(Response.error(e.toString()));
      print(e);
    }
  }

  void dispose() {
    _categoryListController.close();
  }
}
