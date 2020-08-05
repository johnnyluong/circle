import 'package:circle/constants.dart';
import 'package:flutter/material.dart';
import 'package:circle/Screens/Welcome/welcome_screen.dart';

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
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: WelcomeScreen(), //TODO: Change based on logged in status
      home: SplashScreen(auth: new Auth()),
    );
  }
}
