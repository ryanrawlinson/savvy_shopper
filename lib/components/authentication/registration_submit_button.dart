import 'package:flutter/material.dart';
import 'package:savvy_shopper/utilities/constants.dart';

class RegistrationSubmitButton extends StatelessWidget {
  final String buttonText;
  final Function onSubmit;

  RegistrationSubmitButton({
    @required this.buttonText,
    @required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSubmit,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(buttonText, style: kRegistrationButtonTextStyle),
      ),
      style: ElevatedButton.styleFrom(primary: Colors.green.shade400),
    );
  }
}
