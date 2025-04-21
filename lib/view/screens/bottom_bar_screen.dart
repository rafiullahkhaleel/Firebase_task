import 'package:task/view/screens/home_screen.dart';
import 'package:task/view/screens/search_screen.dart';
import 'package:task/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {

  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
   int selectedIndex = 0;


  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons.png'),
              color: Colors.black,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/home.png'),
              color: Colors.black,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            activeIcon: Icon(Icons.search_rounded, color: Colors.black),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined, color: Colors.black),
            activeIcon: Icon(Icons.settings, color: Colors.black),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}
