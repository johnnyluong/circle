import 'package:circle/components/rounded_button.dart';
import 'package:circle/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:circle/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CirclesScreen extends StatefulWidget {
  @override
  _CirclesScreenState createState() => _CirclesScreenState();
}

class _CirclesScreenState extends State<CirclesScreen> {
  Future getCircles() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('My Circles').getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'My Circles',
          style: TextStyle(color: primaryTextColor),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            color: primaryIconColor,
            onPressed: () => _onButtonPressed(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          // width: size.width,
          // height: size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,

                        child: Text('Mountainers', textAlign: TextAlign.center),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onButtonPressed() {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.065),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.28,
                vertical: size.height * 0.1,
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                //TODO: Add image upload functionality
                'Upload Image',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            RoundedInputField(
              text: 'Circle Name',
              icon: Icons.donut_large,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: 'Create Circle',
              color: kPrimaryColor,
              textColor: Colors.white,
              press: () {},
            ),
          ],
        );
      },
    );
  }
}
