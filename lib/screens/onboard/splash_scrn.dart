import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff08074C),
      body: Center(
        child: Container(
          child: Image.asset('assets/logo.png',scale: 20,),
        ),
      ),
    );
  }
}
