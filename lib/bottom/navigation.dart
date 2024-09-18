import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class nav extends StatelessWidget {
  void Function(int)? onTabChange;
  nav({super.key,required this.onTabChange});

  @override
  Widget build(BuildContext context) {
      Color back = Colors.black;
  Color a = Color.fromARGB(248, 53, 52, 52);
  Color b = Color.fromARGB(255, 255, 94, 0);
    return GNav(

      onTabChange: (value) => onTabChange!(value),
      color:back,
      mainAxisAlignment: MainAxisAlignment.center,
      activeColor:  b,
      tabBackgroundColor: a,
      tabBorderRadius: 24,
      tabActiveBorder: Border.all(color: Colors.white),
      tabs: [
      GButton(
        icon: Icons.home,
        iconColor: a,
        text: 'Home',
      ),
       GButton(
        icon: Icons.shopping_bag_outlined,
        iconColor: a,
        text: 'Add',
      ),
      GButton(
        icon: Icons.shopping_bag_outlined,
        iconColor: a,
        text: 'planned',
      )
    ]);
  }
}
