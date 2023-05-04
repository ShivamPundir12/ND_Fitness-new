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
      containerColor = Color(0xffffd700);
      label = p1;
    } else if (selectedPlan == p2) {
      containerColor = Color(0xff808080);
      label = p2;
    } else if (selectedPlan == p3) {
      containerColor = Color(0xffCD7F32);
      label = p3;
    } else if (selectedPlan == p4) {
      containerColor = Color(0xffe5e4e2);
      label = p4;
    } else {
      containerColor = Colors.grey.shade800;
      label = d;
    }

    return {'color': containerColor, 'label': label};
  }
}
