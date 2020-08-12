import 'package:flutter/material.dart';

import 'package:circle/Screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Body(
        size: size,
        auth: auth,
        loginCallback: loginCallback,
      ),
    );
  }
}
