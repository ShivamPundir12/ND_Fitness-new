import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/info/age/age.dart';
import 'package:nd_fitness/screens/info/gender.dart';
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
        // '/Profile': (context) => Profile(),
        // '/home': (context) => MyLogin(),
        // '/register': (context) => MyRegister(),
        // '/nav': (context) => NavPage(),
      },
      home: SplashScreen(),
    );
  }
}
