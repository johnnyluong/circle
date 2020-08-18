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
        backgroundColor: kPrimaryColor,
        title: Text('Circle Settings'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: 'Change Password',
              color: kPrimaryLightColor,
              textColor: primaryTextColor,
              press: () {},
            ),
            RoundedButton(
              text: 'Notification Settings',
              color: kPrimaryLightColor,
              textColor: primaryTextColor,
              press: () {},
            ),
            RoundedButton(
              text: 'Logout',
              color: kPrimaryLightColor,
              textColor: primaryTextColor,
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
