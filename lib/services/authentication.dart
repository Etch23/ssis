import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethods {
  static var firstName, lastName, phoneNumber, landShape, landArea;
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);
  User get user => _auth.currentUser!;
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
  Future<void> createAccount({
    required final firstName,
    required final lastName,
    required final phoneNumber,
    required final emailAddress,
    required final password,
    required final landShape,
    required final landArea,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${_auth.currentUser?.uid}')
          .set({
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'landShape': landShape,
        'landArea': landArea,
        'emailAddress': emailAddress,
        'imageUrl': null,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void Getdata() async {
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc('${_auth.currentUser?.uid}')
        .snapshots()
        .map((event) => null);
  }
}
