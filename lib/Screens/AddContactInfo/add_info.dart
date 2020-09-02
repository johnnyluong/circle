import 'dart:ui';

import 'package:circle/Screens/AddContactInfo/view_contact.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:circle/components/floating_action_button.dart';
import 'package:circle/components/standard_info_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:circle/constants.dart';

class AddInfo extends StatefulWidget {
  final CloudDB cloudDB;
  AddInfo({this.cloudDB});
  State<StatefulWidget> createState() {
    return AddInfoState();
  }
}

class AddInfoState extends State<AddInfo> {
  final _formKey = GlobalKey<FormState>();

  String _firstName;
  String _lastName;
  String _profession;
  String _email;
  String _phoneNumber;

  String contactID;
  Future<DocumentReference> contactReference;

  Map<String, dynamic> makeContact(String firstName, String lastName,
      String profession, String email, String phoneNumber) {
    Map<String, dynamic> newContact = Map<String, dynamic>();
    newContact['firstName'] = firstName;
    newContact['lastName'] = lastName;
    newContact['phoneNumber'] = phoneNumber;
    newContact['email'] = email;
    newContact['profession'] = profession;
    return newContact;
  }

  void addNewContact() async {
    var reference = widget.cloudDB.addContact(
        makeContact(_firstName, _lastName, _profession, _email, _phoneNumber));
    setState(() {
      contactReference = reference;
    });
  }

  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<bool> validateAndSubmit() async {
    try {
      if (validateAndSave()) {
        addNewContact();
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  void resetForm() {
    _formKey.currentState.reset();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: addItemButtonColor),
        title: Text(
          'Add Contact Info',
          style: TextStyle(color: primaryTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Text(
              'Who would you like to join\nyour journey?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: secondaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            _showForm()
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        press: () async {
          bool success = await validateAndSubmit();
          if (success) {
            resetForm();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ViewContactScreen(
                    contactRef: contactReference,
                    name: _firstName + " " + _lastName,
                    profession: _profession,
                  );
                },
              ),
            );
          } 
        }, 
        text: "NEXT: ADD TO CIRCLES",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _showForm() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showNameInput(),
            StandardInfoInput(
              hintText: "Profession *",
              validator: (value) =>
                  value.isEmpty ? 'Must enter Profession' : null,
              onSaved: (value) => _profession = value.trim(),
              icon: Icons.work,
              keyboardType: TextInputType.text,
            ),
            StandardInfoInput(
              hintText: "Email",
              onSaved: (value) => _email = value.trim(),
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            StandardInfoInput(
              hintText: "Phone Number",
              onSaved: (value) => _phoneNumber = value.trim(),
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }

  Widget showNameInput() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          showFirstNameInput(),
          Container(width: 15), //Spacing between fields
          showLastNameInput(),
        ],
      ),
    );
  }

  Widget showFirstNameInput() {
    return Flexible(
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.name,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'First Name *',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryDarkColor),
            ),
            prefixIcon: Icon(
              Icons.person,
              color: secondaryIconColor,
            )),
        validator: (value) => value.isEmpty ? 'First Name required' : null,
        onSaved: (value) => _firstName = value.trim(),
      ),
    );
  }

  Widget showLastNameInput() {
    return Flexible(
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.name,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Last Name *',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryDarkColor),
          ),
        ),
        validator: (value) => value.isEmpty ? 'Last Name required' : null,
        onSaved: (value) => _lastName = value.trim(),
      ),
    );
  }
}
