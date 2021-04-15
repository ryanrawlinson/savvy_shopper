import 'package:flutter/material.dart';
import 'package:savvy_shopper/authentication/auth_manager.dart';
import 'package:savvy_shopper/components/green_elevated_button.dart';
import 'package:savvy_shopper/screens/login_screen.dart';
import 'package:savvy_shopper/utilities/functions.dart';

class AccountContent extends StatelessWidget {
  final AuthManager _authManager = AuthManager();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GreenElevatedButton(
        buttonText: 'SIGN OUT',
        onClick: () async {
          await _authManager.signOut();

          print(_authManager.getUser());

          if (_authManager.getUser() == null) {
            Navigator.popUntil(
                context, ModalRoute.withName(LoginScreen.routeName));
          } else {
            showAlertDialog(context, 'Sign out failed',
                'Sign out could not be completed, please try again.');
          }
        },
      ),
    );
  }
}
