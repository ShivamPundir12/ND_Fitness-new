import 'package:flutter/material.dart';

import '../../../materials/colors.dart';

class PlanCard extends StatelessWidget {
  final String t1;
  final String t2;
  final String t3;
  PlanCard({Key? key, required this.t1, required this.t2, required this.t3})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: text_color2, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${t1}",
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
                    color: background_color.withOpacity(0.7),
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mukta'),
              ),
              Text(
                "${t2}",
                style: TextStyle(
                    color: background_color,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mukta'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              Text(
                "${t3}",
                style: TextStyle(
                    color: background_color,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Mukta'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
