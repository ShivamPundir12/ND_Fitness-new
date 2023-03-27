import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/admin/admn_home.dart';
import 'package:nd_fitness/screens/auth/admin_sign_in.dart';
import 'package:nd_fitness/screens/auth/sign_in.dart';
import 'package:nd_fitness/screens/auth/sign_up.dart';
import 'package:nd_fitness/screens/info/activity_level.dart';
import 'package:nd_fitness/screens/info/age/age.dart';
import 'package:nd_fitness/screens/info/all_set.dart';
import 'package:nd_fitness/screens/info/gender.dart';
import 'package:nd_fitness/screens/info/membership.dart';
import 'package:nd_fitness/screens/info/profile.dart';
import 'package:nd_fitness/screens/onboard/onboarding_scrn.dart';
import 'package:nd_fitness/screens/onboard/splash_scrn.dart';
import 'package:nd_fitness/screens/user/profile.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/onboard': (context) => onbaording_screen(),
        '/signin': (context) => sign_in(),
        '/signup': (context) => sign_up(),
        '/adsignin': (context) => admin_sign_in(),
        '/gend': (context) => gender(),
        '/age': (context) => age(),
        '/level': (context) => activity_level(),
        '/profile': (context) => profile(),
        '/member': (context) => membership(),
        // '/gen': (context) => gender(),
        // '/gen': (context) => gender(),
        // '/age': (context) => age(),
      },
      home: Admin_Home(),
    );
  }
}
