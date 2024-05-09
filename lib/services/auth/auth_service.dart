import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<UserCredential> signInWithEmailPassword(
      String email, String pass) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      _firestore.collection("Users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid.toString(),
        'email': email.toString()
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // print(e);
      throw Exception(e.code);
      // print("error");
      // print(e);
      // return e;
    }
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Failed to reset password: $e");
      throw e;
    }
  }

  Future<void> deleteAccount() async {
    try {
      User? user = _auth.currentUser;

      await user?.delete();

      await _auth.signOut();
    } catch (e) {
      print("Failed to delete account: $e");
    }
  }

  Future<UserCredential> signUpWithEmailPassword(
      String email, String pass) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);
      _firestore
          .collection("Users")
          .doc(userCredential.user!.uid)
          .set({"uid": userCredential.user!.uid, 'email': email});
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // print(101212151651);

      // print(e);
      throw Exception(e.code);
    }
  }
}
