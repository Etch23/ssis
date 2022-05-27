// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'package:sprinkler_system/utils/showSnackBar.dart';
//
// class text extends StatelessWidget {
//
//   final FirebaseAuth _auth;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: IconButton(onPressed: () {
//
//         }, icon: Icon(Icons.ac_unit_rounded)),
//       ),
//     );
//   }
//   Future<void> createAccount({
//     required String firstName,
//     required String lastName,
//     required int phoneNumber,
//     required String email,
//     required String password,
//     required String landShape,
//     required int landArea,
//     required BuildContext context,
//   }) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context, e.message!);
//     }
//
//     ;
//   }
// }
