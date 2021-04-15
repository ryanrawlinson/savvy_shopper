import 'package:flutter/material.dart';

class SelectedNavIcon extends StatelessWidget {
  final String title;

  SelectedNavIcon({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Image.asset('images/dot.png'),
        )
      ],
    );
  }
}
