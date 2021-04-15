import 'package:flutter/material.dart';
import 'package:savvy_shopper/utilities/constants.dart';

class GreenElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function onClick;

  GreenElevatedButton({
    @required this.buttonText,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(buttonText, style: kRegistrationButtonTextStyle),
      ),
      style: ElevatedButton.styleFrom(primary: Colors.green.shade400),
    );
  }
}
