import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/auth/sign_in.dart';
import 'package:nd_fitness/screens/info/gender.dart';
import 'package:page_transition/page_transition.dart';

import '../../services/secure_storage.dart';

String? finalEmail, finalName;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final secure_storage secureStorage = secure_storage();
  @override
  void initState() {
    secureStorage.readSecureData('email').then((value) {
      finalEmail = value;
    });
    secureStorage.readSecureData('name').then((value) {
      finalName = value;
    });
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: finalEmail == null ? sign_in() : gender(),
                type: PageTransitionType.rightToLeftWithFade)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff08074C),
        body: Padding(
          padding: EdgeInsets.only(
            top: 90,
          ),
          child: Center(
            child: Container(
              child: Image.asset(
                'assets/logo.png',
                scale: 14,
              ),
            ),
          ),
        ));
  }
}
