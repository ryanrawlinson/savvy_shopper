import 'package:flutter/material.dart';

class RegistrationTextField extends StatelessWidget {
  RegistrationTextField({
    @required this.inputType,
    @required this.labelText,
    this.isPasswordEnabled = false,
    this.onChanged,
  });

  final TextInputType inputType;
  final String labelText;
  final bool isPasswordEnabled;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: isPasswordEnabled,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.only(bottom: 0.0),
      ),
      onChanged: onChanged,
    );
  }
}
