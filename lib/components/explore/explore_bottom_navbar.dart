import 'package:flutter/material.dart';
import 'package:savvy_shopper/components/explore/selected_nav_icon.dart';

class ExploreBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function onTabSelected;

  ExploreBottomNavBar({this.selectedIndex, this.onTabSelected});

  final List<BottomNavigationBarItem> _bottomNavItems = [
    BottomNavigationBarItem(
      title: Text('Explore'),
      icon: Icon(
        Icons.whatshot_outlined,
        color: Colors.black,
      ),
      activeIcon: SelectedNavIcon(
        title: 'Explore',
      ),
    ),
    BottomNavigationBarItem(
      title: Text('Cart'),
      icon: Icon(
        Icons.shopping_cart_outlined,
        color: Colors.black,
      ),
      activeIcon: SelectedNavIcon(
        title: 'Cart',
      ),
    ),
    BottomNavigationBarItem(
      title: Text('Account'),
      icon: Icon(
        Icons.account_circle_outlined,
        color: Colors.black,
      ),
      activeIcon: SelectedNavIcon(
        title: 'Account',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedLabelStyle: TextStyle(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      currentIndex: selectedIndex,
      onTap: (index) {
        onTabSelected(index);
      },
      items: _bottomNavItems,
    );
  }
}
