// ignore_for_file: unused_local_variable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/onboard/material/photo_hero.dart';
import 'package:nd_fitness/screens/onboard/onboarding_scrn.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 2),
                pageBuilder:
                    ((BuildContext context, animation, secondaryAnimation) {
                  // Check if user has filled in all details
                  bool profileComplete = false; // Assume profile is complete
                  if (finalEmail == null || finalName == null) {
                  } else {
                    SharedPreferences.getInstance().then((prefs) {
                      String loggedInUserKey = 'email';
                      String? userDataJsonString =
                          prefs.getString(loggedInUserKey).toString();
                      if (prefs.containsKey(userDataJsonString)) {
                        profileComplete = true;
                        Navigator.pushNamed(context, '/usrprofile');
                      }
                    });
                  }
                  return Onboard_screen();
                }),
              ),
            ));
    super.initState();
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
