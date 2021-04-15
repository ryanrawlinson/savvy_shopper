import 'package:flutter/material.dart';
import 'package:savvy_shopper/components/explore/explore_bottom_navbar.dart';
import 'package:savvy_shopper/screens/account_content.dart';
import 'package:savvy_shopper/screens/explore_content.dart';
import 'package:savvy_shopper/components/explore/explore_search_bar.dart';
import 'package:savvy_shopper/screens/cart_content.dart';

class AppContainer extends StatefulWidget {
  static const routeName = '/home';

  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    ExploreContent(),
    CartScreen(),
    AccountContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: ExploreSearchBar(),
        ),
        body: _children[_selectedIndex],
        bottomNavigationBar: ExploreBottomNavBar(
          selectedIndex: _selectedIndex,
          onTabSelected: _onItemTapped,
        ));
  }
}
