import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:savvy_shopper/authentication/auth_manager.dart';
import 'package:savvy_shopper/components/authentication/registration_submit_button.dart';
import 'package:savvy_shopper/components/authentication/registration_textfield.dart';
import 'package:savvy_shopper/utilities/strings.dart';

class SignUpScreen extends StatefulWidget {
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 100.0,
                ),
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
                            style: TextStyle(
                                fontSize: 35.0, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 60.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                RegistrationTextField(
                                  inputType: TextInputType.text,
                                  labelText: 'Name',
                                  isPasswordEnabled: false,
                                  errorMessage: kNameErrorText,
                                  onChanged: (value) {
                                    _name = value;
                                  },
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                RegistrationTextField(
                                  inputType: TextInputType.emailAddress,
                                  labelText: 'Email',
                                  isPasswordEnabled: false,
                                  errorMessage: kEmailAddressErrorText,
                                  onChanged: (value) {
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
                                  padding: EdgeInsets.only(top: 60.0),
                                  child: RegistrationSubmitButton(
                                    buttonText: 'SIGN UP',
                                    onSubmit: () async {
                                      setState(() {
                                        _isLoading = true;
                                      });

                                      if (_formKey.currentState.validate()) {
                                        try {
                                          UserCredential user =
                                              await _authManager.signUp(
                                            name: _name,
                                            email: _email,
                                            password: _password,
                                          );

                                          print(user);
                                        } catch (e) {
                                          setState(() {
                                            _isLoading = false;
                                          });
                                        }
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
