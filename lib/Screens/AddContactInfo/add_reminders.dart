import 'package:circle/Screens/Home/main_screen.dart';
import 'package:circle/components/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:circle/constants.dart';

class AddRemindersScreen extends StatefulWidget {

  @override
  _AddRemindersScreenState createState() => _AddRemindersScreenState();
}

class _AddRemindersScreenState extends State<AddRemindersScreen> {

  bool _isButtonEnabled = true;

  _toggleButton() {
    setState(() {
      _isButtonEnabled = !_isButtonEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Add Reminders to Contacts',
          style: TextStyle(color: primaryTextColor),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center, //Controls vertical center
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'TEMP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Add reminders to contacts here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        enabled: _isButtonEnabled,
        color: kPrimaryDarkColor,
        press: () {
          /*
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MainScreen(); //How to return to main without parameters
              },
            ),
          );
          */
        }, //Handle case of multiple entries vs single
        text: "FINISH",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}