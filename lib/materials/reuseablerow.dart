import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final double width;

  const InfoRow({
    Key? key,
    required this.title,
    required this.value,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Mukta',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(
          width: width,
        ),
        Container(
          child: Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'Mukta',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
