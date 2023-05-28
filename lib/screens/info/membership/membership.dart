// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nd_fitness/screens/info/membership/plan_card.dart';
import 'package:nd_fitness/services/firestore.dart';
import 'package:provider/provider.dart';
import '../../../materials/colors.dart';
import '../../../services/container_color.dart';
import '../../../services/secure_storage.dart';
import 'package:intl/intl.dart';

class Membership extends StatefulWidget {
  const Membership({Key? key}) : super(key: key);

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  final secure_storage secureStorage = secure_storage();

  // Plan 1
  String p1t1 = "Bronze Plan";
  String p1t2 = "1 mo";
  String p1t3 = "₹ 1250";
  // Plan 2
  String p2t1 = "Silver Plan";
  String p2t2 = "3 mo";
  String p2t3 = "₹ 3500";
  // Plan 3
  String p3t1 = "Gold Plan";
  String p3t2 = "6 mo";
  String p3t3 = "₹ 7000";
  // Plan 4
  String p4t1 = "Platinum Plan";
  String p4t2 = "12 mo";
  String p4t3 = "₹ 13000";
  // Get the current date and time
  static final DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('dd-MM-yyy');
  String currentDate = DateFormat('dd-MM-yyy').format(now);
  String currentTime = DateFormat('kk:mm:ss').format(now);

  DateTime calculatePlanExpireDate(String planType, Function showNotification) {
    // Get the current date and time
    DateTime currentDate = DateTime.now();

    // Calculate the plan expire date based on the plan type
    switch (planType) {
      case "Bronze Plan":
        currentDate = currentDate.add(Duration(days: 30));
        showNotification(currentDate);
        break;
      case "Silver Plan":
        currentDate = currentDate.add(Duration(days: 90));
        showNotification(currentDate);
        break;
      case "Gold Plan":
        currentDate = currentDate.add(Duration(days: 180));
        showNotification(currentDate);
        break;
      case "Platinum Plan":
        currentDate = currentDate.add(Duration(days: 365));
        showNotification(currentDate);
        break;
    }

    return currentDate;
  }

// Function to show local notification
  void showNotification(DateTime expireDate) async {
    var androidDetails = new AndroidNotificationDetails(
        "channel id", "channel NAME",
        importance: Importance.max);

    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails);

    await FlutterLocalNotificationsPlugin().schedule(
        0,
        "Plan Expiry",
        "Your plan expires soon. Renew now!",
        expireDate,
        generalNotificationDetails);
  }

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
                          date: currentDate,
                          time: currentTime,
                          planexpr: formatter
                              .format(calculatePlanExpireDate(
                                  p1t1, showNotification))
                              .toString(),
                        ),
                        // ontap function for Adding data to database
                        onTap: () {
                          Provider.of<PlanProvider>(context, listen: false)
                              .updateSelectedPlan(p1t1);
                          Firecloud.addplandetail(
                            p1t1,
                            p1t2,
                            p1t3,
                            currentDate,
                            currentTime,
                            formatter
                                .format(calculatePlanExpireDate(
                                    p1t1, showNotification))
                                .toString(),
                          );
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/allset", (route) => false);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        //Card to show the Plan details
                        child: PlanCard(
                          t1: p2t1,
                          t2: p2t2,
                          t3: p2t3,
                          date: currentDate,
                          time: currentTime,
                          planexpr: formatter
                              .format(calculatePlanExpireDate(
                                  p2t1, showNotification))
                              .toString(),
                        ),
                        onTap: () {
                          // Provider.of<PlanProvider>(context, listen: false)
                          //     .updateSelectedPlan(p2t1);
                          Firecloud.addplandetail(
                            p2t1,
                            p2t2,
                            p2t3,
                            currentDate,
                            currentTime,
                            formatter
                                .format(calculatePlanExpireDate(
                                    p2t1, showNotification))
                                .toString(),
                          );
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
                          date: currentDate,
                          time: currentTime,
                          planexpr: formatter
                              .format(calculatePlanExpireDate(
                                  p3t1, showNotification))
                              .toString(),
                        ),
                        onTap: () {
                          Firecloud.addplandetail(
                            p3t1,
                            p3t2,
                            p3t3,
                            currentDate,
                            currentTime,
                            formatter
                                .format(calculatePlanExpireDate(
                                    p3t1, showNotification))
                                .toString(),
                          );
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
                          date: currentDate,
                          time: currentTime,
                          planexpr: formatter
                              .format(calculatePlanExpireDate(
                                  p4t1, showNotification))
                              .toString(),
                        ),
                        onTap: () {
                          // Provider.of<PlanProvider>(context, listen: false)
                          //     .updateSelectedPlan(p4t1);
                          Firecloud.addplandetail(
                            p4t1,
                            p4t2,
                            p4t3,
                            currentDate,
                            currentTime,
                            formatter
                                .format(calculatePlanExpireDate(
                                    p4t1, showNotification))
                                .toString(),
                          );
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
