import 'package:circle/Screens/Home/main_screen.dart';
import 'package:circle/Screens/Login/login_screen.dart';
import 'package:circle/Screens/SignUp/components/or_divider.dart';
import 'package:circle/Screens/SignUp/components/social_icon.dart';
import 'package:circle/Services/Authentication/authentication.dart';
import 'package:circle/components/already_have_an_account.dart';
import 'package:circle/components/rounded_button.dart';
import 'package:circle/components/standard_info_input.dart';
import 'package:circle/components/standard_password_input.dart';
import 'package:circle/constants.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({this.auth});
  final BaseAuth auth;

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.17),
            Text(
              'Circle',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 45,
              ),
            ),
            SizedBox(height: size.height * 0.12),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: 45,
              ),
              child: Text(
                'Create Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            _showForm(),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
                color: kPrimaryLightColor,
                textColor: primaryTextColor,
                text: "SIGN UP",
                // User Authentication
                press: () async {
                  dynamic result = await widget.auth.signUp(_email, _password);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MainScreen( //TODO: Authentication & UserID and logoutCallback should be passed in as well
                          auth: widget.auth,
                        );
                      },
                    ),
                  );
                }),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pop(context);
              },
            ),
            OrDivider(),
            SignUpWithSocial(),
          ],
        ),
      ),
    );
  }

  Widget _showForm() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            StandardInfoInput(
              hintText: "Email",
              validator: (value) =>
                  value.isEmpty ? 'Invalid Email' : null, //TODO
              onSaved: (value) => _email = value.trim(),
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            StandardPasswordInput(
              hidePassword: _hidePassword,
              hintText: "Password",
              validator: (value) =>
                  value.isEmpty ? 'Invalid Password' : null, //TODO
              onSaved: (value) => _password = value.trim(),
              onPressed: () {
                setState(() => _hidePassword = !_hidePassword);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpWithSocial extends StatelessWidget {
  const SignUpWithSocial({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
