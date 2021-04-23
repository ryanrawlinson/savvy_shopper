import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvy_shopper/models/provider/cart_model.dart';
import 'package:savvy_shopper/models/provider/product_model.dart';
import 'package:savvy_shopper/screens/app_container.dart';
import 'package:savvy_shopper/screens/cart_content.dart';
import 'package:savvy_shopper/screens/item_category_screen.dart';
import 'package:savvy_shopper/screens/item_details_screen.dart';
import 'package:savvy_shopper/screens/login_screen.dart';
import 'package:savvy_shopper/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(
          create: (context) => ProductModel(),
        ),
      ],
      child: SavvyShopperApp(),
    ),
  );
}

class SavvyShopperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savvy Shopper',
      initialRoute: AppContainer.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        AppContainer.routeName: (context) => AppContainer(),
        ItemDetailsScreen.routeName: (context) => ItemDetailsScreen(),
        CartScreen.routeName: (context) => CartScreen(),
        ItemCategoryScreen.routeName: (context) => ItemCategoryScreen(),
      },
      theme: ThemeData.light().copyWith(
        backgroundColor: Colors.grey.shade100,
      ),
    );
  }
}
