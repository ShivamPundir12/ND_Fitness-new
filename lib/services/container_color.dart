import 'package:flutter/material.dart';

class PlanProvider with ChangeNotifier {
  String _selectedPlan = 'Bronze Plan';

  void updateSelectedPlan(String plan) {
    _selectedPlan = plan;
    notifyListeners();
  }

  String get selectedPlan => _selectedPlan;
}
