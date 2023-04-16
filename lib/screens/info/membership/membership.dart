import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/info/membership/plan_card.dart';
import 'package:nd_fitness/services/firestore.dart';

import '../../../materials/colors.dart';
import '../../../services/secure_storage.dart';

class Membership extends StatefulWidget {
  const Membership({Key? key}) : super(key: key);

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  final secure_storage secureStorage = secure_storage();

  String p1t1 = "Bronze Plan";
  String p1t2 = "1 mo";
  String p1t3 = "1250";
  String p2t1 = "Silver Plan";
  String p2t2 = "3 mo";
  String p2t3 = "3500";
  String p3t1 = "Gold Plan";
  String p3t2 = "6 mo";
  String p3t3 = "7000";
  String p4t1 = "Platinum Plan";
  String p4t2 = "12 mo";
  String p4t3 = "13000";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04),
              child: Text(
                "Select your",
                style: TextStyle(
                  color: text_color2.withOpacity(0.5),
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Mukta",
                ),
              ),
            ),
            Container(
              child: Text(
                "Membership plan!",
                style: TextStyle(
                    color: text_color2,
                    fontSize: 37,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Mukta"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: text_color2,
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: PlanCard(
                          t1: p1t1,
                          t2: p1t2,
                          t3: p1t3,
                        ),
                        onTap: () async {
                          await Firecloud.addplandetail(p1t1, p1t2, p1t3);
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/allset", (route) => false);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        child: PlanCard(
                          t1: p2t1,
                          t2: p2t2,
                          t3: p2t3,
                        ),
                        onTap: () async {
                          await Firecloud.addplandetail(p2t1, p2t2, p2t3);
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/allset", (route) => false);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        child: PlanCard(
                          t1: p3t1,
                          t2: p3t2,
                          t3: p3t3,
                        ),
                        onTap: () async {
                          await Firecloud.addplandetail(p3t1, p3t2, p3t3);
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/allset", (route) => false);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        child: PlanCard(
                          t1: p4t1,
                          t2: p4t2,
                          t3: p4t3,
                        ),
                        onTap: () async {
                          await Firecloud.addplandetail(p4t1, p4t2, p4t3);
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/allset", (route) => false);
                        },
                      ),
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
