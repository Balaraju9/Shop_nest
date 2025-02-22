import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'fav.dart';
import 'homescreen.dart';

import 'ProfileScreen.dart';

import 'categories.dart';

class navbar extends StatefulWidget {
  const navbar();

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int pu=0;
  int index=2;
  List screen=[
    Categories(),
    fav(),
    HomeScreen(),
    Cart(sendingtocart: [], sendingtocart1: [], sendingtocart2: [],),
    ProfileScreen(),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.grid_view_outlined, size: 27, color: index == 0 ? Colors.white : Colors.grey),
          Icon(index==1?Icons.favorite:Icons.favorite_outline, size: 27, color: index == 1 ? Colors.pink : Colors.grey),
          Icon(Icons.home, size: 31, color: index == 2 ? Colors.white : Colors.grey),
          Icon(Icons.shopping_cart_rounded, size: 27, color: index == 3 ? Colors.white : Colors.grey),
          Icon(Icons.person_rounded, size: 27, color: index == 4 ? Colors.white : Colors.grey),
        ],
        onTap: (int selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        color: Colors.black,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: index==1?Colors.yellowAccent:Colors.orange,
        height: 75.0,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 350),
      ),
      body: screen[index],

    );
  }
}
