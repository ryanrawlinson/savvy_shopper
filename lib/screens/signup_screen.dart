import 'package:flutter/material.dart';
import 'package:savvy_shopper/components/registration_textfield.dart';

class SignUpScreen extends StatelessWidget {
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
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            RegistrationTextField(
                              inputType: TextInputType.emailAddress,
                              labelText: 'Email',
                              isPasswordEnabled: false,
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            RegistrationTextField(
                              inputType: TextInputType.visiblePassword,
                              labelText: 'Password',
                              isPasswordEnabled: true,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 60.0),
                              child: RaisedButton(
                                onPressed: () {},
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                color: Colors.green.shade400,
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
