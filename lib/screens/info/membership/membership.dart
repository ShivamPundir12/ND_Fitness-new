import 'package:flutter/material.dart';
import 'package:nd_fitness/screens/info/membership/plan_card.dart';

import '../../../materials/colors.dart';
import '../../../services/secure_storage.dart';

class Membership extends StatefulWidget {
  const Membership({Key? key}) : super(key: key);

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  final secure_storage secureStorage = secure_storage();
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
                child: InkWell(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/usrprofile",
                    ((route) => false),
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        PlanCard(
                          t1: "Bronze Plan",
                          t2: "1 mo",
                          t3: "1250",
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        PlanCard(t1: "Silver Plan", t2: "3 mo", t3: "3500"),
                        SizedBox(
                          height: 30,
                        ),
                        PlanCard(t1: "Gold Plan", t2: "6 mo", t3: "7000"),
                        SizedBox(
                          height: 30,
                        ),
                        PlanCard(t1: "Platinum Plan", t2: "12 mo", t3: "13000")
                      ],
                    ),
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
