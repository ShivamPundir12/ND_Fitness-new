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
import 'package:nd_fitness/services/notification_services.dart';
import 'screens/auth/forgot_pass.dart';
import 'package:nd_fitness/screens/user/edit_profile.dart';
import 'package:nd_fitness/screens/user/plan.dart';
import 'screens/info/Weight/weight.dart';
import 'screens/info/all_set.dart';
import 'screens/user/profile.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      navigatorKey: widget.navigatorKey,
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
        '/editprofile': (context) => EditProfile(),
        '/plan': (context) => Plan(),
        '/allset': (context) => AllSet(),
        '/weigt': (context) => Usr_Weight(),
        '/ForgotPass': (context) => ForgotPassword(),
      },
      home: SplashScreen(),
    );
  }
}
