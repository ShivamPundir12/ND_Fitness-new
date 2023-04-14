import 'package:flutter/material.dart';

import '../../materials/colors.dart';
import '../../services/secure_storage.dart';

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
                  top: MediaQuery.of(context).size.height * 0.0),
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
                  onTap: () => Navigator.pushNamed(context, "/usrprofile"),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: text_color2,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bronze Plan',
                                style: TextStyle(
                                    color: background_color,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Mukta'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Duration : ',
                                    style: TextStyle(
                                        color:
                                            background_color.withOpacity(0.7),
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Mukta'),
                                  ),
                                  Text(
                                    '1 mo',
                                    style: TextStyle(
                                        color: background_color,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Mukta'),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  Text(
                                    '1250',
                                    style: TextStyle(
                                        color: background_color,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Mukta'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: text_color2,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Silver Plan',
                                style: TextStyle(
                                    color: background_color,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Mukta'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Duration : ',
                                    style: TextStyle(
                                        color:
                                            background_color.withOpacity(0.7),
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Mukta'),
                                  ),
                                  Text(
                                    '3 mo',
                                    style: TextStyle(
                                        color: background_color,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Mukta'),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  Text(
                                    '3500',
                                    style: TextStyle(
                                        color: background_color,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Mukta'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: text_color2,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gold Plan',
                                style: TextStyle(
                                    color: background_color,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Mukta'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Duration : ',
                                    style: TextStyle(
                                        color:
                                            background_color.withOpacity(0.7),
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Mukta'),
                                  ),
                                  Text(
                                    '6 mo',
                                    style: TextStyle(
                                        color: background_color,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Mukta'),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  Text(
                                    '7000',
                                    style: TextStyle(
                                        color: background_color,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Mukta'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: text_color2,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Platinum Plan',
                                style: TextStyle(
                                    color: background_color,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Mukta'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Duration : ',
                                    style: TextStyle(
                                        color:
                                            background_color.withOpacity(0.7),
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Mukta'),
                                  ),
                                  Text(
                                    '12 mo',
                                    style: TextStyle(
                                        color: background_color,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Mukta'),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  Text(
                                    '13000',
                                    style: TextStyle(
                                        color: background_color,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Mukta'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
