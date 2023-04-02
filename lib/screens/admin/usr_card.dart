import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../materials/colors.dart';

class Usr_Card extends StatefulWidget {
  const Usr_Card({Key? key}) : super(key: key);

  @override
  State<Usr_Card> createState() => _Usr_CardState();
}

class _Usr_CardState extends State<Usr_Card> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        decoration: BoxDecoration(
            color: text_color2, borderRadius: BorderRadius.circular(20)),
        height: 190,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.none,
              padding: EdgeInsets.all(20),
              child: ClipRRect(
                  child: Image.asset(Assets.assetsPerson, fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(15)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'David Warner',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Mukta',
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      child: Text(
                        '28',
                        style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'Mukta',
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          color: card, borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        'Member',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Mukta',
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                      color: aclevel, borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Intermediate',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Mukta',
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
