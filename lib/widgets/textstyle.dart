import 'package:flutter/material.dart';

TextStyle customstyle({
  double size = 18,
  dynamic weight = FontWeight.w500,
  dynamic family = 'Mukta',
  dynamic color = Colors.black,
}) =>
    TextStyle(
      color: color,
      fontSize: size,
      fontFamily: family,
      fontWeight: weight,
    );
