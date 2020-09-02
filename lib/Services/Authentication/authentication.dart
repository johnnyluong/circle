import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signInWithEmail(String email, String password);
  Future<String> signInAnonymously();
  // Added getUserID function
  Future<String> getUserID();
  Future<String> signUp(String email, String password);
  Future<FirebaseUser> getCurrentUser();
  Future<void> sendEmailVerification();
  Future<void> signOut();
  Future<bool> isEmailVerified();
  String validatePassword(String password);
  String validateEmail(String email);
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> getUserID() async {
    try {
      FirebaseUser user = await _firebaseAuth.currentUser();
      return user.uid;
    } catch (e) {
      print("No user ID");
      return null;
    }
  }

  Future<String> signInWithEmail(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<String> signInAnonymously() async {
    AuthResult result = await _firebaseAuth.signInAnonymously();
    FirebaseUser user = result.user;
    return user.uid;
  }

  // Added try catch block
  Future<String> signUp(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  String validatePassword(String password) {
    if (password.isEmpty) return "Must enter password";
    if (password.length < 6) return "Must enter 6 or more characters";
    return null;
  }

  String validateEmail(String email) {
    if (email.trim().isEmpty) return "Enter a valid email address";
    return null;
  }
}
