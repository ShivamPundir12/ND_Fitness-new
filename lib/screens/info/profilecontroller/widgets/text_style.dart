import 'package:flutter/material.dart';

TextStyle profilestyle({
  double size = 15,
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
