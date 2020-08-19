import 'dart:ui';

import 'package:circle/Screens/AddContactInfo/finish_single_contact.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:circle/components/floating_action_button.dart';
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

  void addNewContact() {
    print(_firstName +
        ", " +
        _lastName +
        ", " +
        _profession +
        " " +
        _email +
        " " +
        _phoneNumber);
    widget.cloudDB.addContact(
        makeContact(_firstName, _lastName, _profession, _email, _phoneNumber));
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
    if (validateAndSave()) {
      addNewContact();
      return true;
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
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(color: primaryIconColor),
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
              ),
              textAlign: TextAlign.center,
            ),
            _showForm()
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        color: kPrimaryDarkColor,
        press: () async {
          bool success = await validateAndSubmit();
          if (success) {
            resetForm(); //TODO: Write to the database in next screen instead of current
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FinishSingleContactScreen();
                },
              ),
            );
          } //TODO: Pass new contact value to next screen
        }, //Handle case of multiple entries vs single
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
            showProfessionInput(),
            showEmailInput(),
            showPhoneInput(),
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
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'First Name *',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryDarkColor),
            ),
            icon: Icon(
              Icons.person,
              color: primaryIconColor,
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
        keyboardType: TextInputType.text,
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

  Widget showProfessionInput() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Profession *',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryDarkColor),
          ),
          icon: Icon(
            Icons.work,
            color: primaryIconColor,
          ),
        ),
        validator: (value) => value.isEmpty ? 'Must specify profession' : null,
        onSaved: (value) => _profession = value.trim(),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Email',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryDarkColor),
            ),
            icon: Icon(
              Icons.mail,
              color: primaryIconColor,
            )),
        //validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPhoneInput() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.phone,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Phone Number',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryDarkColor),
            ),
            icon: Icon(
              Icons.phone,
              color: primaryIconColor,
            )),
        //validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _phoneNumber = value.trim(),
      ),
    );
  }
}
