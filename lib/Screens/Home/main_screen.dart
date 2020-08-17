import 'package:circle/Screens/Circles/circles_screen.dart';
import 'package:circle/Screens/ContactList/contact_list_screen.dart';
import 'package:circle/Screens/Home/home_screen.dart';
import 'package:circle/Screens/Reminders/reminders_screen.dart';
import 'package:circle/Services/Authentication/authentication.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:flutter/material.dart';
import 'package:circle/constants.dart';

class MainScreen extends StatefulWidget {
  MainScreen({this.auth, this.userId, this.logoutCallback});
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _MainScreenState createState() => _MainScreenState(auth: auth);
}

class _MainScreenState extends State<MainScreen> {
  _MainScreenState({this.auth});
  final Auth auth;

  int _currentIndex = 0;

  List<Widget> _widgetOptions;
  CloudDB cloudDB;
  @override
  void initState() {
    super.initState();
    cloudDB = CloudDB.fromUID(widget.userId);

    _widgetOptions = <Widget>[
      HomeScreen(logoutCallback: widget.logoutCallback),
      CirclesScreen(),
      RemindersScreen(),
      ContactListScreen(cloudDB: cloudDB),
    ];
  }

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
