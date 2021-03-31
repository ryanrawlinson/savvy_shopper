import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedLabelStyle: TextStyle(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          title: Text('Explore'),
          icon: Icon(
            Icons.whatshot_outlined,
            color: Colors.black,
          ),
        ),
        BottomNavigationBarItem(
          title: Text('Cart'),
          icon: SvgPicture.asset('images/icon_cart.svg'),
        ),
        BottomNavigationBarItem(
          title: Text('Account'),
          icon: SvgPicture.asset('images/icon_user.svg'),
        ),
      ],
    );
  }
}
