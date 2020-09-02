// import 'package:circle/Screens/Home/main_screen.dart';
// import 'package:circle/Screens/Login/login_screen.dart';

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
  SignupScreen({
    @required this.auth,
    @required this.loginCallback,
  });
  final BaseAuth auth;
  final Function([bool]) loginCallback;

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  bool _hidePassword = true;

  bool _isLoading;
  String _errorMessage;
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });

    try {
      String userId = "";
      if (validateAndSave()) {
        userId = await widget.auth.signUp(_email, _password);
        // widget.auth.sendEmailVerification();
        print('Email: $_email');
        print('Password: $_password');
        print('Signed up user: $userId');
      }

      if (userId.length > 0 && userId != null) {
        widget.loginCallback(true);
        Navigator.pop(context);
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
        _errorMessage = e.message;
        _formKey.currentState.reset();
      });
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
    // widget.auth.getCurrentUser().then(
    //   (user) {
    //     setState(() {
    //       if (user != null) {
    //         Navigator.pop(context);
    //       }
    //     });
    //   },
    // );
  }

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
              press: () {
                validateAndSubmit();
              },
            ),
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
              validator: (value) => widget.auth.validateEmail(value),
              onSaved: (value) => _email = value.trim(),
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            StandardPasswordInput(
              hidePassword: _hidePassword,
              hintText: "Password",
              validator: (value) => widget.auth.validatePassword(value), //TODO
              onSaved: (value) => _password = value,
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
          press: () {},
        ),
        SocialIcon(
          iconSrc: "assets/icons/twitter.svg",
          press: () {},
        ),
        SocialIcon(
          iconSrc: "assets/icons/google-plus.svg",
          press: () {},
        ),
      ],
    );
  }
}
