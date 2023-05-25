// ignore_for_file: unused_local_variable
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/admin/navbar/admin_bar.dart';
import 'package:nd_fitness/screens/onboard/material/photo_hero.dart';
import 'package:nd_fitness/screens/onboard/onboarding_scrn.dart';
import '../../services/secure_storage.dart';

String? finalEmail, finalName;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final secure_storage secureStorage = secure_storage();
  late Timer timer;
  @override
  void initState() {
    secureStorage.readSecureData('email').then((value) {
      finalEmail = value;
    });
    secureStorage.readSecureData('name').then((value) {
      finalName = value;
    });
    timer = Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(seconds: 2),
          pageBuilder: ((BuildContext context, animation, secondaryAnimation) {
            // Check if user has filled in all details
            bool profileComplete = false; // Assume profile is complete
            if (finalEmail == null || finalName == null) {
            } else {
              final snapshot = FirebaseFirestore.instance
                  .collection('userdetail')
                  .doc(FirebaseAuth.instance.currentUser?.uid)
                  .get();
              snapshot.then((snapshot) {
                var userdata = snapshot.data();
                String? key = userdata?["Plan"];
                if (finalEmail == 'ndfitness@admin.com') {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminBar(),
                      ),
                      (route) => false);
                } else {
                  if (key != null) {
                    profileComplete = true;
                    Navigator.pushNamed(context, '/usrprofile');
                  } else {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/signin', (route) => false);
                  }
                }
              });
            }
            return Onboard_screen();
          }),
        ),
      ),
    );
    super.initState();
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff08074C),
        body: Padding(
          padding: EdgeInsets.only(
            top: 70,
          ),
          child: Center(
            child: Container(
              child: PhotoHero(photo: 'assets/logo.png', width: 110),
            ),
          ),
        ));
  }
}
