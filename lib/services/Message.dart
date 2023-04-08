import 'package:flutter/material.dart';

class Message {
  static custommessage(String e, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.blueGrey.shade300,
      content: Text(
        e.toString(),
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      duration: Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
