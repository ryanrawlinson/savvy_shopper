import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;

class ExploreSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30.0),
              ),
              margin: EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14.0),
                    child: Icon(
                      CupertinoIcons.search,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset('images/search_camera.png'),
        ],
      ),
    );
  }
}
