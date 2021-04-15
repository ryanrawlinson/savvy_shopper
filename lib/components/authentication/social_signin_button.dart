import 'package:flutter/material.dart';

class SocialSignInTile extends StatelessWidget {
  final String iconPath;
  final String titleText;
  final Function onPressed;

  SocialSignInTile({
    @required this.iconPath,
    @required this.titleText,
    @required this.onPressed,
  });

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
        onTap: onPressed,
      ),
    );
  }
}
