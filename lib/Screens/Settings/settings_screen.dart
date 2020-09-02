import 'package:circle/Screens/Settings/about_screen.dart';
import 'package:circle/constants.dart';
import 'package:circle/components/rounded_button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback logoutCallback;

  SettingsScreen({this.logoutCallback});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'Settings',
          style: TextStyle(color: primaryTextColor),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: 'ABOUT',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AboutScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: 'CHANGE PASSWORD',
            ),
            RoundedButton(
              text: 'NOTIFICATION SETTINGS',
            ),
            RoundedButton(
              text: 'LOGOUT',
              press: () {
                widget.logoutCallback();
              },
            ),
          ],
        ),
      ),
    );
  }
}
