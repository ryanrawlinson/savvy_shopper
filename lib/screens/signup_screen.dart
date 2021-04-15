import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:savvy_shopper/authentication/auth_manager.dart';
import 'package:savvy_shopper/components/green_elevated_button.dart';
import 'package:savvy_shopper/components/authentication/registration_textfield.dart';
import 'package:savvy_shopper/screens/app_container.dart';
import 'package:savvy_shopper/utilities/constants.dart';
import 'package:savvy_shopper/utilities/functions.dart';
import 'package:savvy_shopper/utilities/strings.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthManager _authManager = AuthManager();
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _email;
  String _password;
  bool _isLoading = false;

  void _onSignUpTapped() async {
    try {
      UserCredential user = await _authManager.signUp(
        name: _name,
        email: _email,
        password: _password,
      );

      if (user != null) {
        Navigator.pushNamed(context, AppContainer.routeName);
      }

      print(user);
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      showAlertDialog(context, 'Unable to create account',
          'Your account could not be created, please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Up',
                            style: kAuthCardTitleStyle,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: RegistrationTextField(
                                    inputType: TextInputType.text,
                                    labelText: 'Name',
                                    isPasswordEnabled: false,
                                    errorMessage: kNameErrorText,
                                    onChanged: (value) {
                                      _name = value;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: RegistrationTextField(
                                    inputType: TextInputType.emailAddress,
                                    labelText: 'Email',
                                    isPasswordEnabled: false,
                                    errorMessage: kEmailAddressErrorText,
                                    onChanged: (value) {
                                      _email = value;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: RegistrationTextField(
                                    inputType: TextInputType.visiblePassword,
                                    labelText: 'Password',
                                    isPasswordEnabled: true,
                                    errorMessage: kPasswordErrorText,
                                    onChanged: (value) {
                                      _password = value;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 60.0),
                                  child: GreenElevatedButton(
                                    buttonText: 'SIGN UP',
                                    onClick: () async {
                                      setState(() {
                                        _isLoading = true;
                                      });

                                      if (_formKey.currentState.validate()) {
                                        _onSignUpTapped();
                                      }

                                      setState(() {
                                        _isLoading = false;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
