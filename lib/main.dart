import 'package:circle/Screens/Root/root_screen.dart';
import 'package:circle/Services/Authentication/authentication.dart';
import 'package:circle/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: new RootScreen(auth: new Auth()),
      // home: new RootScreen(),
    );
  }
}
