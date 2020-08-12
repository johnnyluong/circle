import 'package:flutter/material.dart';
import 'package:circle/Screens/Login/login_screen.dart';
import 'package:circle/Screens/SignUp/signup_screen.dart';
import 'package:circle/constants.dart';
import 'package:flutter_svg/svg.dart';

import 'package:circle/Screens/Welcome/components/background.dart';
import 'package:circle/components/rounded_button.dart';
import 'package:circle/Screens/Home/main_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //size provides dimensions of device screen
    return Background(
      //This widget controls the images in the corners
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Circle',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: size.height * 0.05), //Spacing betwen widgets
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: 'LOGIN',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: 'SIGN UP',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
              color: kPrimaryLightColor,
              textColor: Colors.black,
            ),
            SizedBox(height: size.height * 0.03),
            // anonymous sign in button
            RoundedButton(
              text: 'ANONYMOUS SIGN IN',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
