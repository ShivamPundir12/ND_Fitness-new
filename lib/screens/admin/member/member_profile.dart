import 'package:flutter/material.dart';
import 'package:nd_fitness/generated/assets.dart';
import 'package:nd_fitness/materials/colors.dart';

class Member_Profile extends StatefulWidget {
  const Member_Profile({Key? key}) : super(key: key);

  @override
  State<Member_Profile> createState() => _Member_ProfileState();
}

class _Member_ProfileState extends State<Member_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: text_color2,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              clipBehavior: Clip.none,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(300, 70),
                ),
                child: Image.asset(Assets.assetsPerson, fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "David Warner",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Mukta',
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "28",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Mukta',
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      "A Muscle freak with ambition and discipline to fulfill my dreams",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Mukta',
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mukta',
                        color: Colors.black.withOpacity(0.75),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "davidwarner123@gmail.com",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mukta',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "Mobile no.",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mukta',
                        color: Colors.black.withOpacity(0.75),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "+91 5423652545",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mukta',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "Address",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mukta',
                        color: Colors.black.withOpacity(0.75),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "House no. 13, downtown streets, California, New York",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mukta',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
