import 'package:flutter/material.dart';

import '../view/screens/home_screen.dart';
import '../view/screens/profile_screen.dart';
import '../view/screens/search_screen.dart';

class BottomBarProvider extends ChangeNotifier{
  int _selectedIndex = 0;


  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen()
  ];

  int get selectedIndex => _selectedIndex;

  set  selectedIndex(int value){
    _selectedIndex = value;
    notifyListeners();
  }
}