import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:staff_manager/app/screens/add_staffs.dart';
import 'package:staff_manager/app/screens/show_staffs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void _navigateBottomNavbar(int selectedIndex) {
    setState(
      () {
        _currentIndex = selectedIndex;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            AddStaffs(),
            ShowStaffs(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            selectedIndex: _currentIndex,
            onTabChange: _navigateBottomNavbar,
            gap: 12,
            color: Colors.white,
            activeColor: Colors.white,
            style: GnavStyle.google,
            tabBackgroundColor: Colors.blue.shade700,
            padding: const EdgeInsets.all(16),
            tabs: [
              GButton(
                onPressed: () {
                  _navigateBottomNavbar(0);
                },
                iconSize: 20,
                iconColor: Colors.blue,
                backgroundColor: Colors.pink.shade400,
                icon: Icons.forum_outlined,
                text: 'Input Form',
                style: GnavStyle.google,
              ),
              GButton(
                onPressed: () {
                  _navigateBottomNavbar(1);
                },
                backgroundColor: Colors.blue,
                iconSize: 20,
                iconColor: Colors.pink.shade400,
                icon: Icons.person,
                text: 'Staff Details',
                style: GnavStyle.google,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
