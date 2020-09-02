import 'package:circle/Services/Authentication/authentication.dart';
import 'package:circle/components/standard_info_input.dart';
import 'package:circle/components/standard_password_input.dart';
import 'package:circle/constants.dart';
import 'package:flutter/material.dart';
import 'package:circle/Screens/SignUp/signup_screen.dart';
import 'package:circle/components/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
    this.auth,
    this.loginCallback,
  }) : super(key: key);

  final BaseAuth auth;
  final Function([bool]) loginCallback;
  @override
  State<StatefulWidget> createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoading;

  bool _hidePassword = true;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login by email or anonymous login
  void validateAndSubmit(bool isAnonymous) async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });

    try {
      String userId = "";
      if (isAnonymous) {
        userId = await widget.auth.signInAnonymously();
        print('Signed in anonymously: $userId');
      } else {
        if (validateAndSave()) {
          userId = await widget.auth.signInWithEmail(_email, _password);
          print('Email: $_email');
          print('Password: $_password');
          print('Signed in: $userId');
        }
      }
      if (userId.length > 0 && userId != null) {
        widget.loginCallback();
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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        //This fixes pixel overflow issue
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
                'Welcome.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            _showForm(),
            GestureDetector(
              onTap: () {}, // TODO: Reset password
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(
                  right: 42,
                  bottom: 14,
                ),
                child: Text('Forgot Password?'),
              ),
            ),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryColor,
              textColor: primaryTextColor,
              press: () {
                validateAndSubmit(false);
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: primaryTextColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignupScreen(
                            auth: widget.auth,
                            loginCallback: widget.loginCallback,
                          )),
                );
              },
            ),
            SizedBox(height: size.height * 0.02),
            GestureDetector(
              onTap: () {
                validateAndSubmit(true); //
              },
              child: Text(
                "Tap Here for Guest Login",
                style: TextStyle(
                  color: primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
              onSaved: (value) => _email = value,
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
