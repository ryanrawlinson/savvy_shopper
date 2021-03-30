import 'package:flutter/material.dart';

void showAlertDialog(final BuildContext context, final String title,
    final String description) async {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Dismiss'),
            ),
          ],
        );
      });
}
