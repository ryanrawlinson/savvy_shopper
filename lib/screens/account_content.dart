import 'package:flutter/material.dart';
import 'package:savvy_shopper/authentication/auth_manager.dart';
import 'package:savvy_shopper/components/green_elevated_button.dart';
import 'package:savvy_shopper/screens/login_screen.dart';
import 'package:savvy_shopper/utilities/functions.dart';

class AccountContent extends StatelessWidget {
  final AuthManager _authManager = AuthManager();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 120.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'David Spade',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text('iamdavid@gmail.com'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset('images/icon_order_history.png'),
            title: Text('Order History'),
            trailing: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 15,
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Image.asset('images/icon_cards.png'),
            title: Text('Cards'),
            trailing: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 15,
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Image.asset('images/icon_edit_profile.png'),
            title: Text('Edit Profile'),
            trailing: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 15,
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Image.asset('images/icon_logout.png'),
            title: Text('Log Out'),
            trailing: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 15,
              color: Colors.black,
            ),
            onTap: () async {
              await _authManager.signOut();

              if (_authManager.getUser() == null) {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(LoginScreen.routeName),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

// Center(
// child: GreenElevatedButton(
// buttonText: 'SIGN OUT',
// onClick: () async {
// await _authManager.signOut();
//
// print(_authManager.getUser());
//
// if (_authManager.getUser() == null) {
// Navigator.popUntil(
// context, ModalRoute.withName(LoginScreen.routeName));
// } else {
// showAlertDialog(context, 'Sign out failed',
// 'Sign out could not be completed, please try again.');
// }
// },
// ),
// );
