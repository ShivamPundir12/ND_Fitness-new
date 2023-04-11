import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/materials/colors.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              child: Text(
                "Tell us about yourself",
                style: TextStyle(
                    color: text_color2,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Mukta"),
              ),
            ),
            Container(
              child: Text(
                "To give you a better experience and to get to know your gender",
                style: TextStyle(
                  color: text_color2.withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Mukta",
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(color: gend, shape: BoxShape.circle),
              child: Image.asset(
                Assets.assetsMale,
                scale: 1.1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                'Male',
                style: TextStyle(
                  color: text_color2,
                  fontFamily: 'Mukta',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(color: gend, shape: BoxShape.circle),
              child: Image.asset(
                Assets.assetsFemale,
                scale: 1.1,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              child: Text(
                'Female',
                style: TextStyle(
                  color: text_color2,
                  fontFamily: 'Mukta',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/age');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: text_color2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: background_color),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
