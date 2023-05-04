import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/materials/colors.dart';

import '../../services/Message.dart';
import '../../services/firestore.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  final String gen1 = "Male";
  final String gen2 = "Female";
  bool maleSelected = false;
  bool femaleSelected = false;
  Color selected_color = text_color2;
  bool _isSelected = false;
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
            GestureDetector(
              onTap: () {
                try {
                  Firecloud.selectgen(gen1);
                  Message.custommessage("You Will Start as $gen1", context);

                  // Set _isSelected to true when activity level is selected
                  setState(() {
                    maleSelected = true;
                    femaleSelected = false;
                    _isSelected = true;
                  });
                } catch (e) {
                  Message.custommessage(e.toString(), context);
                }
              },
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    color: maleSelected ? selected_color : gend,
                    shape: BoxShape.circle),
                child: Image.asset(
                  Assets.assetsMale,
                  scale: 1.1,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                gen1,
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
            GestureDetector(
              onTap: () {
                try {
                  Firecloud.selectgen(gen2);
                  Message.custommessage("You Will Start as $gen2", context);

                  // Set _isSelected to true when activity level is selected
                  setState(() {
                    maleSelected = false;
                    femaleSelected = true;
                    _isSelected = true;
                  });
                } catch (e) {
                  Message.custommessage(e.toString(), context);
                }
              },
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    color: femaleSelected ? selected_color : gend,
                    shape: BoxShape.circle),
                child: Image.asset(
                  Assets.assetsFemale,
                  scale: 1.1,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              child: Text(
                gen2,
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
                if (_isSelected) {
                  Navigator.pushNamed(context, "/weigt");
                } else {
                  // Show an error message to the user that they need to select an activity level
                  Message.custommessage('Please Select Your Gender', context);
                }
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
