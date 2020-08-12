import 'package:flutter/material.dart';
import 'package:circle/Screens/SignUp/components/body.dart';

class SignupScreen extends StatelessWidget {
  //modified constructor
  SignupScreen({this.auth});
  final BaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(auth: auth),
    );
  }
}
