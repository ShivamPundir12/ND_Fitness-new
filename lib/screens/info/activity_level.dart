// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/info/profile.dart';
import 'package:nd_fitness/services/Message.dart';
import 'package:nd_fitness/services/firestore.dart';
import '../../materials/colors.dart';

class Activity_level extends StatefulWidget {
  const Activity_level({Key? key}) : super(key: key);

  @override
  State<Activity_level> createState() => _Activity_levelState();
}

class _Activity_levelState extends State<Activity_level> {
  final String activ1 = 'Beginner';
  final String activ2 = 'Intermediate';
  final String activ3 = 'Advance';
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
                  top: MediaQuery.of(context).size.height * 0.13),
              child: Text(
                "Physical Activity Level?",
                style: TextStyle(
                    color: text_color2,
                    fontSize: 33,
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
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            InkWell(
              onTap: () async {
                try {
                  await Firecloud.addphysicalactiv(activ1);
                  Message.custommessage("You Will Start as $activ1", context);

                  // Set _isSelected to true when activity level is selected
                  setState(() {
                    _isSelected = true;
                  });
                } catch (e) {
                  Message.custommessage(e.toString(), context);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: gend,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Text(
                  'Beginner',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: background_color),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                try {
                  await Firecloud.addphysicalactiv(activ2);
                  Message.custommessage("You Will Start as $activ2", context);

                  // Set _isSelected to true when activity level is selected
                  setState(() {
                    _isSelected = true;
                  });
                } catch (e) {
                  Message.custommessage(e.toString(), context);
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
                  'Intermediate',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: background_color),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                try {
                  await Firecloud.addphysicalactiv(activ3);
                  Message.custommessage("You Will Start as $activ3", context);

                  // Set _isSelected to true when activity level is selected
                  setState(() {
                    _isSelected = true;
                  });
                } catch (e) {
                  Message.custommessage(e.toString(), context);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: gend,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Text(
                  'Advance',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: background_color),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/age"),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.04,
                        horizontal: MediaQuery.of(context).size.height * 0.04),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: text_color2.withOpacity(0.15),
                      border: Border.all(
                          strokeAlign: 1.0, width: 2, color: Colors.white),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Back',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: text_color2),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (_isSelected) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ),
                      );
                    } else {
                      // Show an error message to the user that they need to select an activity level
                      Message.custommessage(
                          'Please select an activity level.', context);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.04,
                        horizontal: MediaQuery.of(context).size.height * 0.05),
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
          ],
        ),
      ),
    );
  }
}
