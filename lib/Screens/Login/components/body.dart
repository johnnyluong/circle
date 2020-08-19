import 'package:circle/Services/Authentication/authentication.dart';
import 'package:circle/components/text_field_container.dart';
import 'package:circle/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:circle/Screens/SignUp/signup_screen.dart';
import 'package:circle/components/already_have_an_account.dart';
import 'package:circle/components/rounded_button.dart';
import 'package:circle/components/rounded_input_field.dart';
import 'package:circle/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:circle/components/text_field_line.dart';
// import 'package:flutter/src/widgets/media_query.dart';
// import 'package:circle/Screens/Login/components/background.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
    @required this.size,
    this.auth,
    this.loginCallback,
  }) : super(key: key);

  final BaseAuth auth;
  final VoidCallback loginCallback;
  final Size size;
  @override
  State<StatefulWidget> createState() => new _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;

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
    return Scaffold(
      body: SingleChildScrollView(
        //This fixes pixel overflow issue
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: widget.size.height * 0.2,
            ),
            Text(
              'Circle',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: widget.size.height * 0.2,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 10,
              ),
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),

            TextFieldLine(
              hintText: "Email",
              icon: Icons.email,
              onChanged: (value) async {
                _email = value;
              },
            ),

            // onChanged: onChanged,

            RoundedInputField(
              text: "Your Email",
              onChanged: (value) async {
                // email = value;
              },
            ),

            Container(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Email',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {}, // TODO: Reset password
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 10,
                ),
                child: Text('Forget Password?'),
              ),
            ),

            // RoundedInputField(
            // text: "Your Email",
            // icon: Icons.person,
            // onChanged: (value) {},
            // ),
            // RoundedPasswordField(
            // onChanged: (value) {},
            // ),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryLightColor,
              textColor: primaryTextColor,
              press: () {
                validateAndSubmit();
                // while (_isLoading);
                // Navigator.pop(
                //   context,
                // );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return HomeScreen(); //TODO: Integrate authentication
                //     },
                //   ),
                // );
              },
            ),
            SizedBox(height: widget.size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
            SizedBox(height: widget.size.height * 0.03),
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
}
