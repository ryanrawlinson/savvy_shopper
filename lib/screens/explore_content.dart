import 'package:flutter/material.dart';
import 'package:savvy_shopper/blocs/CategoryBloc.dart';
import 'package:savvy_shopper/blocs/ProductsBloc.dart';
import 'package:savvy_shopper/components/explore/product_card.dart';
import 'package:savvy_shopper/models/categories.dart';
import 'package:savvy_shopper/models/products.dart';
import 'package:savvy_shopper/networking/Response.dart';

import '../components/explore/category_circle.dart';

class ExploreContent extends StatefulWidget {
  @override
  _ExploreContentState createState() => _ExploreContentState();
}

class _ExploreContentState extends State<ExploreContent> {
  CategoryBloc _bloc;
  ProductsBloc _productsBloc;

  Image _getCategoryImage(String categoryName) {
    Image image;

    if (categoryName.toLowerCase() == 'men clothing') {
      image = Image.asset('images/icon_mens_shoe.png');
    } else if (categoryName.toLowerCase() == 'electronics') {
      image = Image.asset('images/icon_gadgets.png');
    } else if (categoryName.toLowerCase() == 'jewelery') {
      image = Image.asset('images/icon_jewelry.png');
    } else if (categoryName.toLowerCase() == 'women clothing') {
      image = Image.asset('images/icon_women_clothing.png');
    }

    return image;
  }

  Widget _getCategoryWidgets(List<String> categoryNames) {
    final List<Widget> categoryWidgets = [];
    for (var name in categoryNames) {
      categoryWidgets.add(
        CategoryCircle(
          categoryName: name,
          categoryImage: _getCategoryImage(name),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: categoryWidgets,
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
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        height: 120,
        child: StreamBuilder<Response<Categories>>(
            stream: _bloc.categoryStream,
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
                    return _getCategoryWidgets(snapshot.data.data.categories);
                  case Status.ERROR:
                    return Text(snapshot.data.message);
                    break;
                }
                return Center(child: CircularProgressIndicator());
              }
              return Container();
            }),
      ),
      StreamBuilder<Response<Products>>(
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
                  return Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                      children: List.generate(
                          snapshot.data.data.products.length, (index) {
                        return ProductCard(
                          product: snapshot.data.data.products[index],
                        );
                      }),
                    ),
                  );
                case Status.ERROR:
                  return Text(snapshot.data.message);
                  break;
              }
              return Center(child: CircularProgressIndicator());
            }
            return Container();
          }),
    ]);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
