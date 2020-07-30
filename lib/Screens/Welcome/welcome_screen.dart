import 'package:flutter/material.dart';
import 'package:circle/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Body(),
    // );
    return Scaffold(
      body: Body(
        auth: auth,
        loginCallback: loginCallback,
      ),
    );
  }
}
