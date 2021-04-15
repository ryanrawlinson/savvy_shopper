import 'package:flutter/material.dart';
import '../../utilities/extensions.dart';

class CategoryCircle extends StatelessWidget {
  final String categoryName;
  final Image categoryImage;

  CategoryCircle({this.categoryName, this.categoryImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: .5,
          shape: CircleBorder(),
          color: Colors.white,
          child: Container(
            width: 65.0,
            height: 65.0,
            child: categoryImage ??
                Image.asset(
                  'images/google.png',
                  height: 20.0,
                  width: 20.0,
                ),
            padding: EdgeInsets.all(20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            categoryName.toTitleCase(),
            style: TextStyle(fontSize: 11.0),
          ),
        ),
      ],
    );
  }
}
