import 'package:flutter/material.dart';

class RegistrationTextField extends StatelessWidget {
  RegistrationTextField({
    @required this.inputType,
    @required this.labelText,
    this.isPasswordEnabled = false,
    this.onChanged,
    this.errorMessage,
  });

  final TextInputType inputType;
  final String labelText;
  final bool isPasswordEnabled;
  final Function onChanged;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: isPasswordEnabled,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.only(bottom: 0.0),
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value.isEmpty || value == null) {
          return errorMessage;
        }

        return null;
      },
    );
  }
}
