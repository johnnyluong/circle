import 'package:flutter/material.dart';
import 'package:circle/Screens/Login/login_screen.dart';
import 'package:circle/Screens/SignUp/signup_screen.dart';
import 'package:circle/constants.dart';
import 'package:flutter_svg/svg.dart';

<<<<<<< HEAD
import 'package:circle/Screens/Welcome/components/background.dart';
import 'package:circle/components/rounded_button.dart';

class Body extends StatelessWidget {
  //modified constructor
  Body({this.auth});
  final BaseAuth auth;

=======
import 'package:flutter_app/Screens/Welcome/components/background.dart';
import 'package:flutter_app/components/rounded_button.dart';
import 'package:flutter_app/Services/Authentication/authentication.dart';

class Body extends StatelessWidget {
  Body({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;
>>>>>>> 1bd6907... Finish anon login.
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
                      return LoginScreen(
                        auth: auth,
                        loginCallback: loginCallback,
                      );
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
                      return SignupScreen(auth: auth);
                    },
                  ),
                );
              },
              color: kPrimaryLightColor,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
