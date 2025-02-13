// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:mi_data/screens/about_screen.dart';
import 'package:mi_data/screens/fetch_data.dart';
import 'package:mi_data/screens/local_data_screen.dart';
import 'package:mi_data/widgets/bottom_nav_bar.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    FetchDataScreen(),
    LocalDataScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
        Color customColor = const Color(0xFF50B97B);
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        
    title: Text('MI Data Repositories', style: TextStyle(color: Colors.white),),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}