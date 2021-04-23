import 'package:flutter/material.dart';
import '../../utilities/extensions.dart';

class CategoryCircle extends StatelessWidget {
  final String categoryName;
  final Image categoryImage;
  final Function onItemTapped;

  CategoryCircle({this.categoryName, this.categoryImage, this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onItemTapped,
          child: Card(
            elevation: .75,
            shape: CircleBorder(),
            color: Colors.white,
            child: Container(
              width: 65.0,
              height: 65.0,
              child: categoryImage ?? null,
              padding: EdgeInsets.all(20.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            categoryName.toTitleCase() ?? '',
            style: TextStyle(fontSize: 11.0),
          ),
        ),
      ],
    );
  }
}
