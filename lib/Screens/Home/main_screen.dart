import 'package:circle/Screens/ContactList/contact_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:circle/Screens/Circles/circles_screen.dart';
import 'package:circle/Screens/Circles/my_network_screen.dart';
import 'package:circle/Screens/Reminders/reminders_screen.dart';
import 'package:circle/constants.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CirclesScreen(),
    RemindersScreen(),
    // MyNetworkScreen(),
    ContactListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 23,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.donut_large),
            title: Text('Circles'),
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Reminders'),
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('My Network'),
            backgroundColor: kPrimaryColor,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
