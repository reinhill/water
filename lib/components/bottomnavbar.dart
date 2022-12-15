import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/screens/cookbook.dart';
import 'package:water/screens/cookbookPrac.dart';
import 'package:water/screens/fav.dart';
import 'package:water/screens/homescreen.dart';
import 'package:water/screens/homescreenPrac.dart';
import 'package:water/screens/profilescreen.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
   int selectedIndex = 0;
  final pagescreens = [
    CookBookPrac(),
    HomeScreenPrac(),
    Fav(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: pagescreens),
          bottomNavigationBar: Container(
        height: 75.0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.purple.withOpacity(0.23),
          elevation: 0.0,
          selectedItemColor: cAccentColor,
          unselectedItemColor: Colors.white.withOpacity(1.0),
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            buildBottomNavigationBarItem(Icons.menu_book_outlined, 0),
            buildBottomNavigationBarItem(Icons.kitchen_outlined, 1),
            buildBottomNavigationBarItem(Icons.favorite, 2),
             buildBottomNavigationBarItem(Icons.face_outlined, 3),
           ],
         ),
       ),
      );
      BottomNavigationBarItem buildBottomNavigationBarItem(
      IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Column(
            children: [
              Icon(icon, size: 30,),
              SizedBox(
                height: 2,
              ),
              Container(
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? cAccentColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0)),
              )
            ],
          ),
        ),
        label: "");
  }
}
