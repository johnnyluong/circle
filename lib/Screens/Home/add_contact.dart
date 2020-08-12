import 'dart:io';
import 'dart:ui';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:circle/components/rounded_button.dart';
import 'package:circle/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_app/Services/CloudDB/cloud_db.dart';

class AddContact extends StatefulWidget {
  AddContact({this.cloudDB});
  final CloudDB cloudDB;
  State<StatefulWidget> createState() {
    return AddContactState(auth: auth);
  }
}

class AddContactState extends State<AddContact> {
  //modified constructor
  AddContactState({this.auth});
  final BaseAuth auth;

  //added TextEditingControllers
  final first = TextEditingController();
  final last = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final tag = TextEditingController();

  File _image;
  final picker = ImagePicker();
  final _textEditingController = TextEditingController();

  // Get image from photo
  Future _getImage() async {
    var _pickedImage = await _picker.getImage(source: ImageSource.gallery);

    File image = File(_pickedImage.path);

    setState(() {
      _image = image;
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
      widget.cloudDB.addContact(makeContact(name, "", "", "", ""));
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = Firestore.instance.collection("Users");
    String user_id;
    // convert Future to String
    auth.getUserID().then((val) {
      user_id = val;
    });

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Add New Contact',
          style: TextStyle(color: Colors.white),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Upload image
            Container(
              height: 100,
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: _getImage,
                child: Container(
                  child: _image == null
                      ? Icon(Icons.add_a_photo)
                      : Image.file(_image),
                ),
              ),
            ),
            // Name
            Container(
                padding: const EdgeInsets.all(30),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'First Name'),
                      ),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: last,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Last Name'),
                      ),
                    ),
                  ],
                )),
            // Phone number
            NewContactField(
              hintText: "Phone Number",
              controller: phone,
            ),
            NewContactField(
              hintText: "Email",
              controller: email,
            ),
            NewContactField(
              hintText: "Tag",
              controller: tag,
            ),
            // Uplpad button
            RoundedButton(
              text: "ADD CONTACT",
              color: kPrimaryColor,
              textColor: Colors.white,
              /*
              press: () async {
                String fullname = first.text + " " + last.text;
                await db
                    .document(user_id)
                    .collection("contacts")
                    .document(fullname)
                    .setData({
                  'First Name': first.text,
                  'Last Name': last.text,
                  'phone': phone.text,
                  'email': email.text,
                  'tags': tag.text
                });
                print(user_id);
              },
              */
              press: addNewContact(_textEditingController.text.toString()),
            ),
          ],
        ),
      ),
    );
  }
}

class NewContactField extends StatelessWidget {
  final String hintText;
  TextEditingController controller;
  NewContactField({Key key, this.hintText, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8), //space around text
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.95,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
