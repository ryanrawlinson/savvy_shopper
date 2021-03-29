import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:savvy_shopper/screens/login_screen.dart';
import 'package:savvy_shopper/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SavvyShopperApp());
}

class SavvyShopperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savvy Shopper',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
      },
      theme: ThemeData.light().copyWith(
        backgroundColor: Colors.grey.shade100,
      ),
    );
  }
}
