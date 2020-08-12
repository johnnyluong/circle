import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:circle/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  //modified constructor
  WelcomeScreen({this.auth});
  final BaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(auth: auth));
=======
import 'package:flutter_app/Screens/Welcome/components/body.dart';
import 'package:flutter_app/Services/Authentication/authentication.dart';

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
>>>>>>> 1bd6907... Finish anon login.
  }
}
