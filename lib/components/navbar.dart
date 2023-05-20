import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/pages/favorites.dart';
import 'package:finalproject/pages/homepage.dart';
import 'package:finalproject/pages/profile.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  List pages = [Homepage(), FavoritePage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(canvasColor: Palette.mainColor),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.group), label: 'Profile'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xff000000),
            unselectedItemColor: Color(0xffF9FBE7),
            onTap: _onItemTapped,
          ),
        ));
  }
}
