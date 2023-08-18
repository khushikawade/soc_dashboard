import 'package:flutter/material.dart';
import 'package:solved_dashboard/services/models/home_detail_model.dart';
import 'package:solved_dashboard/services/models/home_response.dart';

class DashboardData extends ChangeNotifier {
  HomeList? _dashboardData;

  HomeList? get dashboardData => _dashboardData;
  HomDetail? _getHomeDetail = HomDetail();

  HomDetail? get getHomeDetail => _getHomeDetail;

  void setDashBoardData(HomeList? data) async {
    _dashboardData = data;
    notifyListeners();
  }

  void setHomeDetail(HomDetail? getHomeDetail) async {
    _getHomeDetail = getHomeDetail;
    notifyListeners();
  }
}
