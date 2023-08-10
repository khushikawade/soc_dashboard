import 'package:flutter/material.dart';
import 'package:solved_dashboard/services/models/home_response.dart';

class DashboardData extends ChangeNotifier {
  HomeList? _dashboardData;

  HomeList? get dashboardData => _dashboardData;

  void setDashBoardData(HomeList? data) async {
    _dashboardData = data;
    notifyListeners();
  }
}
