// widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
  Color customColor = const Color(0xFF50B97B);
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.cloud_download,color: customColor),
          label: 'Fetch Data',
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.storage, color: customColor),
          label: 'Local Data',
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.info, color: customColor),
          label: 'About',
        ),
      ],
    );
  }
}