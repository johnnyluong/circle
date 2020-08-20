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
  final VoidCallback loginCallback;
  @override
  State<StatefulWidget> createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;

  bool _hidePassword = true;

  bool validateAndSave() {
    // final form = _formKey.currentState;
    // if (form.validate()) {
    //   form.save();
    //   return true;
    // }
    // return false;
    return true;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          // userId = await widget.auth.signIn(_email, _password);
          userId = await widget.auth.signInAnonymously();
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        if (userId.length > 0 && userId != null && _isLoginForm) {
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
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
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
                child: Text('Forget Password?'),
              ),
            ),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryColor,
              textColor: primaryTextColor,
              press: () {
                validateAndSubmit();
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
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.02),
            GestureDetector(
              onTap: () {
                validateAndSubmit(); //
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
              validator: (value) =>
                  value.isEmpty ? 'Must enter email address' : null, //TODO
              onSaved: (value) => _email = value.trim(),
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            StandardPasswordInput(
              hidePassword: _hidePassword,
              hintText: "Password",
              validator: (value) =>
                  value.isEmpty ? 'Must enter password' : null, //TODO
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
