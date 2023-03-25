import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/auth/admin_sign_in.dart';
import 'package:nd_fitness/screens/auth/sign_in.dart';
import 'package:nd_fitness/screens/auth/sign_up.dart';
import 'package:nd_fitness/screens/info/activity_level.dart';
import 'package:nd_fitness/screens/info/age/age.dart';
import 'package:nd_fitness/screens/info/gender.dart';
import 'package:nd_fitness/screens/info/membership.dart';
import 'package:nd_fitness/screens/info/profile.dart';
import 'package:nd_fitness/screens/onboard/splash_scrn.dart';

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
        '/gen': (context) => gender(),
        '/age': (context) => age(),
        '/activity': (context) => activity_level(),
        '/membership': (context) => membership(),
        '/profile': (context) => profile(),
        '/adminSignin': (context) => admin_sign_in(),
        '/signin': (context) => sign_in(),
        '/signup': (context) => sign_up(),
      },
      home: SplashScreen(),
    );
  }
}
