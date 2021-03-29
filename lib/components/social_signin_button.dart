import 'package:flutter/material.dart';

class SocialSignInTile extends StatelessWidget {
  SocialSignInTile({this.iconPath, this.titleText});

  final String iconPath;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: ListTile(
        leading: Image.asset(
          iconPath,
          height: 30.0,
          width: 30.0,
        ),
        title: Text(
          titleText,
          textAlign: TextAlign.center,
        ),
        trailing: SizedBox(
          width: 0.0,
        ),
      ),
    );
  }
}
