
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int selectedIndex = 0;
  
  List<Widget> screens = [
    Text('Home'),
    Text('Analysis'),
    Text('Search'),
    Text('Setting')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
        onTap: (index){
          selectedIndex = index;
          setState(() {

          });
        },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons.png'),color: Colors.black,),
              activeIcon: ImageIcon(AssetImage('assets/home.png'),color: Colors.black),
              label: 'HOME'
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/shield-search1.png'),color: Colors.black,),
                activeIcon: ImageIcon(AssetImage('assets/shield-search.png'),color: Colors.black,),
                label: 'Analysis'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search,color: Colors.black),
                activeIcon: Icon(Icons.search_rounded,color: Colors.black),
                label: 'SEARCH'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined,color: Colors.black),
                activeIcon: Icon(Icons.settings,color: Colors.black),
                label: 'SETTING'
            ),

          ]),
    );
  }
}
