import 'package:flutter/material.dart';
import 'package:circle/Screens/Login/login_screen.dart';
import 'package:circle/Screens/SignUp/components/or_divider.dart';
import 'package:circle/Screens/SignUp/components/social_icon.dart';
import 'package:circle/components/already_have_an_account.dart';
import 'package:circle/components/rounded_button.dart';
import 'package:circle/components/rounded_input_field.dart';
import 'package:circle/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:circle/Screens/SignUp/components/background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: size.height * 0.02), //Spacing betwen widgets
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.02),
            RoundedInputField(
              text: "Your Email",
              onChanged: (value) {}, 
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {}, //TODO: Authentication and routing
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {}, //TODO: facebook integration
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {}, //TODO: twitter integration
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {}, //TODO: google integration
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


