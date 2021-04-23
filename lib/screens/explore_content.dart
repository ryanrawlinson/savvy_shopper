import 'package:flutter/material.dart';
import 'package:savvy_shopper/blocs/CategoryBloc.dart';
import 'package:savvy_shopper/blocs/ProductsBloc.dart';
import 'package:savvy_shopper/components/explore/products_grid.dart';
import 'package:savvy_shopper/models/categories.dart';
import 'package:savvy_shopper/models/product.dart';
import 'package:savvy_shopper/models/products.dart';
import 'package:savvy_shopper/networking/Response.dart';
import 'package:savvy_shopper/screens/arguments/CategoryScreenArguments.dart';
import 'package:savvy_shopper/screens/item_category_screen.dart';

import '../components/explore/category_circle.dart';

class ExploreContent extends StatefulWidget {
  @override
  _ExploreContentState createState() => _ExploreContentState();
}

class _ExploreContentState extends State<ExploreContent> {
  CategoryBloc _bloc;
  ProductsBloc _productsBloc;
  List<Product> _products;

  Image _getCategoryImage(String categoryName) {
    Image image;

    if (categoryName.toLowerCase() == 'men\'s clothing') {
      image = Image.asset('images/icon_mens_shoe.png');
    } else if (categoryName.toLowerCase() == 'electronics') {
      image = Image.asset('images/icon_gadgets.png');
    } else if (categoryName.toLowerCase() == 'jewelery') {
      image = Image.asset('images/icon_jewelry.png');
    } else if (categoryName.toLowerCase() == 'women\'s clothing') {
      image = Image.asset('images/icon_women_clothing.png');
    }

    return image;
  }

  Widget _getCategoryWidgets(
      List<String> categoryNames, List<Product> products) {
    final List<Widget> categoryWidgets = [];

    if (categoryNames == null) {
      categoryWidgets.add(CategoryCircle());
      categoryWidgets.add(CategoryCircle());
      categoryWidgets.add(CategoryCircle());
      categoryWidgets.add(CategoryCircle());
    } else if (categoryNames.isNotEmpty) {
      for (var name in categoryNames) {
        var filteredProducts =
            products.where((product) => product.category == name).toList();
        categoryWidgets.add(
          CategoryCircle(
            categoryName: name,
            categoryImage: _getCategoryImage(name),
            onItemTapped: () {
              Navigator.pushNamed(context, ItemCategoryScreen.routeName,
                  arguments: CategoryScreenArguments(
                    categoryName: name,
                    products: filteredProducts ?? [],
                  ));
            },
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categoryWidgets,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _bloc = CategoryBloc();
    _productsBloc = ProductsBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Response<Products>>(
      stream: _productsBloc.productsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.LOADING:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              );
              break;
            case Status.COMPLETE:
              _products = snapshot.data.data.products;
              return StreamBuilder<Response<Categories>>(
                  stream: _bloc.categoryStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      switch (snapshot.data.status) {
                        case Status.LOADING:
                          return _getCategoryWidgets(null, null);
                          break;
                        case Status.COMPLETE:
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _getCategoryWidgets(
                                  snapshot.data.data.categories, _products),
                              Expanded(
                                child: ProductsGrid(
                                  products: _products,
                                ),
                              )
                            ],
                          );
                        case Status.ERROR:
                          return Text(snapshot.data.message);
                          break;
                      }
                      return Center(child: CircularProgressIndicator());
                    }
                    return Container();
                  });
            case Status.ERROR:
              return Text(snapshot.data.message);
              break;
          }
          return Center(child: CircularProgressIndicator());
        }
        return Container();
      },
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    _productsBloc.dispose();
    super.dispose();
  }
}
