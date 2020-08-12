import 'package:flutter/material.dart';
import 'package:circle/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  //modified constructor
  WelcomeScreen({this.auth});
  final BaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(auth: auth));
  }
}
