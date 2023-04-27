import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/screens/user/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/secure_storage.dart';
import '../onboard/splash_scrn.dart';

class AllSet extends StatefulWidget {
  const AllSet({Key? key}) : super(key: key);

  @override
  State<AllSet> createState() => _AllSetState();
}

class _AllSetState extends State<AllSet> {
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
                bool profileComplete = true; // Assume profile is complete
                if (finalEmail == null || finalName == null) {
                  profileComplete = false;
                } else {
                  SharedPreferences.getInstance().then((prefs) {
                    if (prefs.getString('name') == null ||
                        prefs.getString('age') == null ||
                        prefs.getString('address') == null) {
                      profileComplete = false;
                    }
                  });
                }
                // Navigate to appropriate screen
                if (profileComplete) {
                  return Usr_Profile();
                } else {
                  return AllSet();
                }
              }),
            )));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.13),
              child: Text(
                "You are all set",
                style: TextStyle(
                    color: text_color2,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Mukta"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Image.asset(
                Assets.assetsDone,
                scale: 1.0,
                color: text_color2,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
