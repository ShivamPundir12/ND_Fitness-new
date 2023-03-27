import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/materials/colors.dart';
import 'package:nd_fitness/screens/admin/usr_card.dart';

class Admin_Home extends StatefulWidget {
  const Admin_Home({Key? key}) : super(key: key);

  @override
  State<Admin_Home> createState() => _Admin_HomeState();
}

class _Admin_HomeState extends State<Admin_Home> {
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
                    top: MediaQuery.of(context).size.height*0.03
                  ),
                  child: Image.asset(Assets.assetsLogosml),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.08
                  ),
                  child: Text('Members',
                  style: TextStyle(
                    color: text_color2,
                    fontSize: 38,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.w900
                  ),),
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
                      Usr_Card(),
                      Usr_Card(),
                      Usr_Card(),
                      Usr_Card(),
                      Usr_Card(),
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
