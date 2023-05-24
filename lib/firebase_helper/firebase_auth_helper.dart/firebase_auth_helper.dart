import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maskarad_online_shop/constants/constants.dart';

class FirebaseAuthHelper {
  static final FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get getAuthChange => _auth.userChanges();

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
      return true;
    } on FirebaseAuthException catch (error) {
      showMessage(getMessageFromErrorCode(error.code.toString()));
      Navigator.pop(context);

      return false;
    }
  }

  Future<bool> sigUp(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.pop(context);
      return true;
    } on FirebaseAuthException catch (error) {
      showMessage(getMessageFromErrorCode(error.code.toString()));
      Navigator.pop(context);

      return false;
    }
  }
}
