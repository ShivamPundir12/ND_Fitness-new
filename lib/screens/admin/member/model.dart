import 'package:flutter/material.dart';

class Model with ChangeNotifier {
  final String name;
  final String age;
  final String address;
  final String? image;
  final String plan;
  final String aclevel;

  Model({
    required this.name,
    required this.age,
    required this.address,
    this.image,
    required this.plan,
    required this.aclevel,
  });
}
