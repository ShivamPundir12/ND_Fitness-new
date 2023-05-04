import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/admin/admn_home.dart';
import 'package:nd_fitness/screens/auth/admin_sign_in.dart';
import 'package:nd_fitness/screens/auth/sign_in.dart';
import 'package:nd_fitness/screens/auth/sign_up.dart';
import 'package:nd_fitness/screens/info/activity_level.dart';
import 'package:nd_fitness/screens/info/gender.dart';
import 'package:nd_fitness/screens/info/membership/membership.dart';
import 'package:nd_fitness/screens/info/profilecontroller/profile.dart';
import 'package:nd_fitness/screens/onboard/onboarding_scrn.dart';
import 'package:nd_fitness/screens/onboard/splash_scrn.dart';
import 'screens/auth/forgot_pass.dart';
import 'screens/info/Weight/weight.dart';
import 'screens/info/all_set.dart';
import 'screens/user/profile.dart';
import 'package:provider/provider.dart';

import 'services/container_color.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (_) => PlanProvider(),
      child: MyApp(),
    ),
  );
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
        '/splash': (context) => SplashScreen(),
        '/onboard': (context) => Onboard_screen(),
        '/signin': (context) => Sign_in(),
        '/signup': (context) => Sign_up(),
        '/gend': (context) => Gender(),
        '/level': (context) => Activity_level(),
        '/profile': (context) => Profile(),
        '/member': (context) => Membership(),
        '/adsignin': (context) => Admin_sign_in(),
        '/adhome': (context) => Admin_Home(),
        '/usrprofile': (context) => Usr_Profile(),
        '/allset': (context) => AllSet(),
        '/weigt': (context) => Usr_Weight(),
        '/ForgotPass': (context) => ForgotPassword(),
      },
      home: SplashScreen(),
    );
  }
}
