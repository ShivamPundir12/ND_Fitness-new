import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/admin/navbar/admin_bar.dart';
import 'package:nd_fitness/services/Message.dart';
import 'package:nd_fitness/services/secure_storage.dart';

class AdminAuth {
  final firebase = FirebaseAuth.instance;
  static adminSignIn(
      BuildContext context, emailController, passwordController) async {
    try {
      final secureStorage = secure_storage();
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.trim(),
              password: passwordController.trim());
      await secureStorage.writeSecureData(
          'email', userCredential.user!.email.toString());
      secureStorage
          .writeSecureData('name', userCredential.user!.displayName.toString())
          .whenComplete(() {
        if (userCredential.user?.email == 'ndfitness@admin.com') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => AdminBar(),
              ),
              (route) => false);
          // Redirect to admin dashboard or perform admin actions
        } else {
          Message.custommessage('Something went wrong', context);
        }
      });
    } catch (e) {
      Message.custommessage(
          'User is not authorized to access the admin portal', context);
    }
  }

  static adminlogout(BuildContext context) {
    final secure_storage secureStorage = secure_storage();
    FirebaseAuth.instance.signOut().whenComplete(
          () => secureStorage.deleteSecureData('email').whenComplete(
                () => Navigator.pushNamedAndRemoveUntil(
                    context, '/signin', (route) => false),
              ),
        );
  }
}
