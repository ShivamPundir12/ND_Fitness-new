// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/screens/admin/admin_reminder.dart';
import 'package:nd_fitness/screens/admin/admn_home.dart';

class AdminBar extends StatefulWidget {
  @override
  _AdminBarState createState() => _AdminBarState();
}

class _AdminBarState extends State<AdminBar> {
  int _currentIndex = 0;

  List<String> _icons = [
    Assets.iconsMember, // Use SVG images as icons
    Assets.iconsReminder,
    Assets.iconsProfile,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: _icons
            .asMap()
            .map((index, icon) => MapEntry(
                  index,
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      icon,
                      width: 24,
                      height: 24,
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                    ),
                    label: '',
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }

  Widget _buildPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Admin_Home();
      case 1:
        return Admin_Reminder();
      default:
        return Container();
    }
  }
}
