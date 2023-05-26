import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:maskarad_online_shop/constants/constants.dart';
import 'package:maskarad_online_shop/models/user_model/user_model.dart';

class FirebaseAuthHelper {
  static final FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

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
      String name, String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      UserCredential? userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel userModel =
          UserModel(id: userCredential.user!.uid, name: name, email: email);
      _firebaseFirestore
          .collection("users")
          .doc(userModel.id)
          .set(userModel.toJson());
      Navigator.pop(context);
      return true;
    } on FirebaseAuthException catch (error) {
      showMessage(getMessageFromErrorCode(error.code.toString()));
      Navigator.pop(context);

      return false;
    }
  }

  void signOut() async {
    await _auth.signOut();
  }

  Future<bool> changePassword(String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      _auth.currentUser!.updatePassword(password);

      Navigator.of(context, rootNavigator: true).pop();
      showMessage("Password Changed");
      Navigator.of(context).pop();

      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context, rootNavigator: true).pop();
      showMessage(error.code.toString());
      return false;
    }
  }
}
