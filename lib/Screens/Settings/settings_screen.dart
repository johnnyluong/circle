import 'package:circle/constants.dart';
import 'package:circle/components/rounded_button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
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
            SizedBox(height: size.height * 0.07),
            RoundedButton(
              text: 'Change Password',
              color: kPrimaryColor,
              textColor: Colors.white,
              press: () {},
            ),
            RoundedButton(
              text: 'Notification Settings',
              color: kPrimaryColor,
              textColor: Colors.white,
              press: () {},
            ),
            RoundedButton(
              text: 'Logout',
              color: kPrimaryColor,
              textColor: Colors.white,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
