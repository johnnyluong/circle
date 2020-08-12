import 'package:flutter/material.dart';
import 'add_contact.dart';

class FirstScreen extends StatelessWidget {
  final CloudDB cloudDB;
  FirstScreen({this.cloudDB});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              // height: 300,
              child: Text(
                'Circle',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Aleo',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.topCenter,
              // height: 50,
              child: Text(
                'Organizing relationships made easier!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          RoundedButton(
            text: "Get Started",
            color: kPrimaryColor,
            textColor: Colors.white,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddContact(
                          cloudDB: cloudDB,
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
