import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Plan extends StatefulWidget {
  const Plan({Key? key}) : super(key: key);

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  final firebasefirestore = FirebaseFirestore.instance
      .collection('userdetail')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.chevron_back,
              color: Colors.black,
              size: 35,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.025,
          vertical: MediaQuery.of(context).size.width * 0.02,
        ),
        child: StreamBuilder(
            stream: firebasefirestore,
            builder: (context, snapshot) {
              var userdata = snapshot.data;
              String? planName = userdata?["Plan"];
              String? date = userdata?["Date"];
              String? planexpr = userdata?["Planexpr"];
              Color planColor;
              switch (planName) {
                case "Bronze Plan":
                  planColor = Color(0xffCD7F32);
                  break;
                case 'Gold Plan':
                  planColor = Color(0xffffd700);
                  break;
                case 'Silver Plan':
                  planColor = Color(0xff808080);
                  break;
                case 'Platinum Plan':
                  planColor = Color(0xffe5e4e2);
                  break;
                default:
                  planColor = Colors.grey;
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Membership',
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Mukta',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.height * 0.025,
                            vertical:
                                MediaQuery.of(context).size.width * 0.025),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: planColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(3, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                planName ?? "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 33,
                                  fontFamily: 'Mukta',
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: Text(
                                    'issued on :',
                                    style: TextStyle(
                                      color: Colors.brown.shade900,
                                      fontSize: 20,
                                      fontFamily: 'Mukta',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  child: Text(
                                    date ?? "",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontFamily: 'Mukta',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, '/member'),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.height * 0.015,
                              vertical:
                                  MediaQuery.of(context).size.width * 0.025,
                            ),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(2, 4),
                                  ),
                                ],
                                color: Colors.brown.shade700,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.edit_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 190),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'Your plan will expire on :',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.75),
                                  fontSize: 16,
                                  fontFamily: 'Mukta',
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                planexpr ?? "",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: 'Mukta',
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
