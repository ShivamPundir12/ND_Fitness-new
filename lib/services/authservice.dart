import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/services/Message.dart';
import 'package:nd_fitness/services/secure_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  // Login Function
  static login(String emailController, String passwordController,
      BuildContext context) async {
    final secure_storage secureStorage = secure_storage();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.trim(),
              password: passwordController.trim());
      await secureStorage.writeSecureData(
          'email', userCredential.user!.email.toString());
      secureStorage.writeSecureData(
          'name', userCredential.user!.displayName.toString());
      Navigator.pushNamedAndRemoveUntil(context, '/gend', (route) => false);
    } on FirebaseAuthException catch (e) {
      Message.custommessage(e.toString(), context);
      Navigator.of(context).pop();
    }
  }

  // Create an account Function / SignUP function
  static signup(String emailController, String passwordController,
      BuildContext context) async {
    final secure_storage secureStorage = secure_storage();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.trim(),
              password: passwordController.trim());
      await secureStorage.writeSecureData(
          'email', userCredential.user!.email.toString());
      Navigator.pushNamedAndRemoveUntil(context, '/gend', (route) => false);
    } on FirebaseAuthException catch (e) {
      Message.custommessage(e.toString(), context);
      Navigator.of(context).pop();
    }
  }

// User Signout Function
  static signout(BuildContext context) {
    final secure_storage secureStorage = secure_storage();
    FirebaseAuth.instance.signOut().whenComplete(
          () => secureStorage.deleteSecureData('email').whenComplete(
                () => Navigator.pushNamedAndRemoveUntil(
                    context, '/signin', (route) => false),
              ),
        );
  }
}
