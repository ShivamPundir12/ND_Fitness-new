import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/screens/admin/reminder_card.dart';

class Admin_Reminder extends StatefulWidget {
  const Admin_Reminder({Key? key}) : super(key: key);

  @override
  State<Admin_Reminder> createState() => _Admin_ReminderState();
}

class _Admin_ReminderState extends State<Admin_Reminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        color: background_color,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Image.asset(Assets.assetsLogosml),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08),
                  child: Text(
                    'Reminder',
                    style: TextStyle(
                        color: text_color2,
                        fontSize: 38,
                        fontFamily: 'Mukta',
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
            Container(
              color: text_color2,
              height: 2,
              width: MediaQuery.of(context).size.width,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Reminder_Card(),
                      Reminder_Card(),
                      Reminder_Card(),
                      Reminder_Card(),
                      Reminder_Card(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
