import 'dart:ui';

import 'package:circle/Screens/AddContactInfo/add_to_circles.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:circle/components/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:circle/constants.dart';
import 'package:image_picker/image_picker.dart';

class AddInfo extends StatefulWidget {
  final CloudDB cloudDB;
  AddInfo({this.cloudDB});
  State<StatefulWidget> createState() {
    return AddInfoState();
  }
}

class AddInfoState extends State<AddInfo> {
  final _picker = ImagePicker();
  final _textEditingController = TextEditingController();
  bool _isButtonEnabled = true;

  _toggleButton() {
    setState(() {
      _isButtonEnabled = !_isButtonEnabled;
    });
  }

  Map<String, dynamic> makeContact(String firstName, String lastName,
      String phoneNumber, String email, String tag) {
    Map<String, dynamic> newContact = Map<String, dynamic>();
    newContact['firstName'] = firstName;
    newContact['lastName'] = lastName;
    newContact['phoneNumber'] = phoneNumber;
    newContact['email'] = email;
    newContact['tag'] = tag;
    return newContact;
  }

  addNewContact(String name) {
    if (name.length > 0) {
      widget.cloudDB.addContact(makeContact(name, "", "", "", "")); //TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(color: primaryIconColor),
        title: Text(
          'Add Contact Info',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.1),
                Text(
                  'Who would you like to join\nyour journey?',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddToCirclesScreen();
              },
            ),
          );
        }, //Handle case of multiple entries vs single
        text: "NEXT: ADD TO CIRCLES",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class NewContactField extends StatelessWidget {
  final String hintText;

  const NewContactField({
    Key key,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8), //space around text
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.95,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
