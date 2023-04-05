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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.assetsPerson),
                    fit: BoxFit.fitHeight)),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 0.90,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                //decoration for the outer wrapper
                color: Colors.white70,
                borderRadius: BorderRadius.circular(
                    30), //border radius exactly to ClipRRect
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08,
                    vertical: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  'DAVID WARNER',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
