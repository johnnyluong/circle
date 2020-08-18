import 'dart:io';
import 'dart:ui';

import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:circle/components/rounded_button.dart';
import 'package:circle/constants.dart';
import 'package:image_picker/image_picker.dart';

class AddContact extends StatefulWidget {
  final CloudDB cloudDB;
  AddContact({this.cloudDB});
  State<StatefulWidget> createState() {
    return AddContactState();
  }
}

class AddContactState extends State<AddContact> {
  File _image;
  final _picker = ImagePicker();
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
          'Add New Contact',
          style: TextStyle(color: primaryTextColor),
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
            ),
            NewContactField(
              hintText: "Email",
            ),
            NewContactField(
              hintText: "Tag",
            ),
            // Uplpad button
            RoundedButton(
              text: "ADD CONTACT",
              color: kPrimaryLightColor,
              textColor: primaryTextColor,
              press: () async {
                addNewContact(_textEditingController.text.toString());
              },
            ),
          ],
        ),
      ),
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
