import 'package:circle/Screens/Home/main_screen.dart';
import 'package:circle/Screens/Login/login_screen.dart';
import 'package:circle/Screens/Splash/splash_screen.dart';
import 'package:circle/Services/Authentication/authentication.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class RootScreen extends StatefulWidget {
  RootScreen({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  bool _isOnboarding = false;
  String _userId = "";
  // CloudDB cloudDB;
  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then(
      (user) {
        setState(() {
          if (user != null) {
            _userId = user?.uid;
          }
          authStatus = user?.uid == null
              ? AuthStatus.NOT_LOGGED_IN
              : AuthStatus.LOGGED_IN;
        });
      },
    );
  }

  void loginCallback([bool isSignup = false]) {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
      _isOnboarding = isSignup;
      // _isOnboarding = true;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return new SplashScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return LoginScreen(
          auth: widget.auth,
          loginCallback: loginCallback,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          return new MainScreen(
            userId: _userId,
            auth: widget.auth,
            logoutCallback: logoutCallback,
            isOnboarding: _isOnboarding,
          );
        } else
          return new SplashScreen();
        break;
      default:
        return new SplashScreen();
    }
  }
}
