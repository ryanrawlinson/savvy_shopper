import 'package:flutter/material.dart';
import 'package:savvy_shopper/authentication/auth_manager.dart';
import 'package:savvy_shopper/components/registration_submit_button.dart';
import 'package:savvy_shopper/components/registration_textfield.dart';
import 'package:savvy_shopper/components/social_signin_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthManager _authManager = AuthManager();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              RegistrationTextField(
                                inputType: TextInputType.emailAddress,
                                labelText: 'Email',
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
                                child: RegistrationSubmitButton(
                                  buttonText: 'SIGN IN',
                                  onSubmit: () async {
                                    var user = await _authManager
                                        .signInWithEmailAndPassword(
                                            email: _email, password: _password);

                                    print(user);
                                  },
                                ),
                              )
                            ],
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
              ),
              SizedBox(
                height: 20.0,
              ),
              SocialSignInTile(
                iconPath: 'images/google.png',
                titleText: 'Sign in with Google',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
