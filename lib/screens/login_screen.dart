import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:savvy_shopper/authentication/auth_manager.dart';
import 'package:savvy_shopper/components/green_elevated_button.dart';
import 'package:savvy_shopper/components/authentication/registration_textfield.dart';
import 'package:savvy_shopper/components/authentication/social_signin_button.dart';
import 'package:savvy_shopper/screens/app_container.dart';
import 'package:savvy_shopper/screens/signup_screen.dart';
import 'package:savvy_shopper/utilities/constants.dart';

import 'package:savvy_shopper/utilities/functions.dart';
import 'package:savvy_shopper/utilities/strings.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthManager _authManager = AuthManager();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextFieldController =
      TextEditingController();
  final TextEditingController _passwordTextFieldController =
      TextEditingController();

  String _email;
  String _password;
  bool _isLoading = false;

  void _signInWithEmailAndPassword() async {
    try {
      UserCredential user = await _authManager.signInWithEmailAndPassword(
          email: _email, password: _password);

      if (user != null) {
        Navigator.pushNamed(context, AppContainer.routeName);

        FocusScope.of(context).unfocus();
        _emailTextFieldController.clear();
        _passwordTextFieldController.clear();
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      showAlertDialog(context, 'Login Failed',
          'Your login information is incorrect please try again.');
    }
  }

  void _signInWithGoogle() async {
    try {
      User user = await _authManager.signInWithGoogle();

      if (user != null) {
        Navigator.pushNamed(context, AppContainer.routeName);

        FocusScope.of(context).unfocus();
        _emailTextFieldController.clear();
        _passwordTextFieldController.clear();
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      showAlertDialog(context, 'Login Failed',
          'Your login information is incorrect please try again.');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Welcome,',
                                      style: kAuthCardTitleStyle,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Text(
                                        'Sign in to Continue',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                              Column(
                                children: [
                                  TextButton(
                                    child: Text(
                                      'Sign Up',
                                      style: kSignUpTextStyle,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, SignUpScreen.routeName);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 60.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  RegistrationTextField(
                                    controller: _emailTextFieldController,
                                    inputType: TextInputType.emailAddress,
                                    labelText: 'Email',
                                    errorMessage: kEmailAddressErrorText,
                                    onChanged: (value) {
                                      print(value);
                                      _email = value;
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40.0),
                                    child: RegistrationTextField(
                                      controller: _passwordTextFieldController,
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
                                    padding: const EdgeInsets.only(top: 18.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Forgot Password?',
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: GreenElevatedButton(
                                      buttonText: 'SIGN IN',
                                      onClick: () async {
                                        setState(() {
                                          _isLoading = true;
                                        });

                                        if (_formKey.currentState.validate()) {
                                          _signInWithEmailAndPassword();
                                        }

                                        setState(() {
                                          _isLoading = false;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    '-OR-',
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: SocialSignInTile(
                    iconPath: 'images/facebook.png',
                    titleText: 'Sign in with Facebook',
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: SocialSignInTile(
                    iconPath: 'images/google.png',
                    titleText: 'Sign in with Google',
                    onPressed: () async {
                      _signInWithGoogle();
                    },
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
