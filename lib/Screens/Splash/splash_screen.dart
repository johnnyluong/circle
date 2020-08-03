import 'dart:async';

import 'package:circle/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
// import 'dart:async';

class SplashScreen extends StatelessWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // Load welcome screen after 5 seconds
    // TODO: Check whether the user is singed in or not.
    // If the user is signed in, load home screen. If the user is not signed in, load the welcome screen.
    // FirebaseUser user = getCurrentUser();
    Timer(Duration(seconds: 5), () => route());
  }

  route() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(auth: widget.auth),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.cloud_download,
                          color: Colors.purpleAccent,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Circle",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.redAccent,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.amberAccent),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                    ),
                    Text(
                      "Organizing relationships made easier",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
