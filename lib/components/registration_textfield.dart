import 'package:flutter/material.dart';

class RegistrationTextField extends StatelessWidget {
  RegistrationTextField({
    @required this.inputType,
    @required this.labelText,
    @required this.isPasswordEnabled,
  });

  final TextInputType inputType;
  final String labelText;
  final bool isPasswordEnabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: isPasswordEnabled,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.only(bottom: 0.0),
      ),
    );
  }
}
