import 'package:flutter/material.dart';
import '../../../materials/colors.dart';

//Defining a stateless widget named PlanCard
class PlanCard extends StatelessWidget {
  // final variables that require values t1, t2 and t3
  final String t1;
  final String t2;
  final String t3;

  //constructor for PlanCard class that assigns the given values to the above mentioned final variables
  PlanCard({Key? key, required this.t1, required this.t2, required this.t3})
      : super(key: key);

  //Overriding the build method of the Stateless widget (PlanCard)
  @override
  Widget build(BuildContext context) {
    return Container(
      //setting padding for the container
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: text_color2, borderRadius: BorderRadius.circular(20)),
      //building the content by using Column Widget
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Displays value of the variable t1 in styled text
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
          //Displays Row with prefix text "Duration : " and time value
          Row(
            children: [
              //Displays fixed styled text "Duration : "
              Text(
                'Duration : ',
                style: TextStyle(
                    color: background_color.withOpacity(0.7),
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mukta'),
              ),
              //Displays the value of the variable t2 in styled text
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
              //Displays the value of the variable t3 in styled text
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
