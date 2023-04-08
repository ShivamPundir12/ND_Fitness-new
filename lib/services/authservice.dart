import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/services/Message.dart';
import 'package:nd_fitness/services/secure_storage.dart';

class AuthServices {
  // Login Function
  static login(String emailController, String passwordController,
      BuildContext context) async {
    final secure_storage secureStorage = secure_storage();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController, password: passwordController);
      await secureStorage.writeSecureData(
          'email', userCredential.user!.email.toString());
      secureStorage.writeSecureData(
          'name', userCredential.user!.displayName.toString());
      Navigator.pushNamedAndRemoveUntil(context, '/gend', ((route) => false));
    } on FirebaseAuthException catch (e) {
      Message.custommessage(e.toString(), context);
      Navigator.of(context).pop();
    }
  }

  // Create an account Funtion / SignUP function
  static signup(String emailController, String passwordController,
      BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController, password: passwordController);
      Navigator.pushNamedAndRemoveUntil(context, '/gend', (route) => false);
    } on FirebaseAuthException catch (e) {
      Message.custommessage(e.toString(), context);
      Navigator.of(context).pop();
    }
  }
}
