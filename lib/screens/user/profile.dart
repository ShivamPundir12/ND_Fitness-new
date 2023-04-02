import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';

class Usr_Profile extends StatefulWidget {
  const Usr_Profile({Key? key}) : super(key: key);

  @override
  State<Usr_Profile> createState() => _Usr_ProfileState();
}

class _Usr_ProfileState extends State<Usr_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(Assets.assetsPerson))),
      ),
    );
  }
}
