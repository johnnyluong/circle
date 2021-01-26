import 'package:circle/Screens/AddContactInfo/add_reminders.dart';
import 'package:circle/components/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:circle/constants.dart';

class AddToCirclesScreen extends StatefulWidget {
  @override
  _AddToCirclesScreenState createState() => _AddToCirclesScreenState();
}

class _AddToCirclesScreenState extends State<AddToCirclesScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Add Contacts to Circles',
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
                  'Add contacts to circles here',
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
        color: kPrimaryDarkColor,
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddRemindersScreen();
              },
            ),
          );
        }, //Handle case of multiple entries vs single
        text: "NEXT: SET REMINDERS",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
