import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:savvy_shopper/authentication/auth_manager.dart';
import 'package:savvy_shopper/components/authentication/green_elevated_buttom.dart';
import 'package:savvy_shopper/components/authentication/registration_textfield.dart';
import 'package:savvy_shopper/components/authentication/social_signin_button.dart';

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
  String _email;
  String _password;
  bool _isLoading = false;

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
              children: [
                SizedBox(
                  height: 100.0,
                ),
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
                                      style: TextStyle(
                                          fontSize: 35.0,
                                          fontWeight: FontWeight.bold),
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
                                      style: TextStyle(
                                        color: Colors.green.shade300,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/signup');
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
                                    inputType: TextInputType.emailAddress,
                                    labelText: 'Email',
                                    errorMessage: kEmailAddressErrorText,
                                    onChanged: (value) {
                                      print(value);
                                      _email = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  RegistrationTextField(
                                    inputType: TextInputType.visiblePassword,
                                    labelText: 'Password',
                                    isPasswordEnabled: true,
                                    errorMessage: kPasswordErrorText,
                                    onChanged: (value) {
                                      _password = value;
                                    },
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
                                          try {
                                            UserCredential user =
                                                await _authManager
                                                    .signInWithEmailAndPassword(
                                                        email: _email,
                                                        password: _password);

                                            if (user != null) {
                                              Navigator.pushNamed(
                                                  context, '/explore');
                                            }
                                          } catch (e) {
                                            setState(() {
                                              _isLoading = false;
                                            });

                                            showAlertDialog(
                                                context,
                                                'Login Failed',
                                                'Your login information is incorrect please try again.');
                                          }
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
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '-OR-',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40.0,
                ),
                SocialSignInTile(
                  iconPath: 'images/facebook.png',
                  titleText: 'Sign in with Facebook',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 20.0,
                ),
                SocialSignInTile(
                  iconPath: 'images/google.png',
                  titleText: 'Sign in with Google',
                  onPressed: () {
                    _authManager.signInWithGoogle();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
