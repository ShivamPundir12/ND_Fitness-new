import 'package:flutter/material.dart';

class PlanUtils {
  static Map<String, dynamic> getPlanInfo(String selectedPlan) {
    String d = "Member";
    String p1 = "Gold Plan";
    String p2 = "Silver Plan";
    String p3 = "Bronze Plan";
    String p4 = "Platinum Plan";
    Color containerColor;
    String label;

    if (selectedPlan == p1) {
      containerColor = Colors.yellow;
      label = p1;
    } else if (selectedPlan == p2) {
      containerColor = Colors.blueGrey.shade300;
      label = p2;
    } else if (selectedPlan == p3) {
      containerColor = Colors.brown;
      label = p3;
    } else if (selectedPlan == p4) {
      containerColor = Colors.grey.shade500;
      label = p4;
    } else {
      containerColor = Colors.grey;
      label = d;
    }

    return {'color': containerColor, 'label': label};
  }
}
