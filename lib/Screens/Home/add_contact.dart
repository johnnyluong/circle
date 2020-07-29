import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/rounded_button.dart';
import 'package:flutter_app/constants.dart';
import 'package:image_picker/image_picker.dart';

class AddContact extends StatefulWidget {
  State<StatefulWidget> createState() {
    return AddContactState();
  }
}

class AddContactState extends State<AddContact> {
  File _image;
  final _picker = ImagePicker();

  // Get image from photo
  Future _getImage() async {
    var _pickedImage = await _picker.getImage(source: ImageSource.gallery);

    File image = File(_pickedImage.path);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Add New Contact'),
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
