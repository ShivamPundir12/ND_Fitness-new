import 'package:flutter/material.dart';
import '../../materials/colors.dart';

class Reminder_Card extends StatefulWidget {
  final String name;
  final String time;
  final String plan;
  const Reminder_Card(
      {Key? key, required this.name, required this.time, required this.plan})
      : super(key: key);

  @override
  State<Reminder_Card> createState() => _Reminder_CardState();
}

class _Reminder_CardState extends State<Reminder_Card> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: text_color2,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 110,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                widget.name,
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                      color: card, borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    widget.plan,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Mukta',
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Text(
                    'ends in :',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Mukta',
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 05,
                ),
                Container(
                  child: Text(
                    widget.time,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Mukta',
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
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
