import 'package:flutter/material.dart';
import 'package:solved_dashboard/models/nav_bar_model.dart';
import 'package:solved_dashboard/services/api.dart';
import 'package:solved_dashboard/services/models/home_detail_model.dart';
import 'package:solved_dashboard/services/models/home_response.dart';
import 'package:solved_dashboard/utils/constant.dart';
import 'package:solved_dashboard/utils/overrides.dart';

class DataViewModel extends ChangeNotifier {
  final Api _api = Api();

  String _schoolId = '';

  String get schoolId => _schoolId;
  set schoolId(String id) {
    _schoolId = id;
    notifyListeners();
  }

  List<DashboardSection>? _homeDataList = List.empty(growable: true);

  List<DashboardSection> get homeDataList => _homeDataList!;
  set homeDataList(List<DashboardSection> homeDataList) {
    _homeDataList = homeDataList;
    notifyListeners();
  }

  List<NavBarModel> _navBarItemList = List.empty(growable: true);

  List<NavBarModel> get navBarItemList => _navBarItemList;
  set navBarItemList(List<NavBarModel> list) {
    _navBarItemList = list;
    notifyListeners();
  }

  List<NavBarModel> _subMenu = List.empty(growable: true);

  List<NavBarModel> get subMenu => _subMenu;
  set subMenu(List<NavBarModel> list) {
    _subMenu = list;
    notifyListeners();
  }

  String? _menuTitleValue = "Home";

  String? get menuTitleValue => _menuTitleValue;
  set menuTitleValue(String? value) {
    _menuTitleValue = value;
    notifyListeners();
  }

  HomDetail? _homeDetails = HomDetail();

  HomDetail? get homeDetails => _homeDetails;
  set homeDetails(HomDetail? data) {
    _homeDetails = data;
    notifyListeners();
  }

  String? _subTitleValue = "";
  String? get subTitleValue => _subTitleValue;
  set subTitleValue(String? value) {
    _subTitleValue = value;
    notifyListeners();
  }

  String _tabTitleValue = 'Home';

  String get tabTitleValue => _tabTitleValue;
  set tabTitleValue(String value) {
    _tabTitleValue = value;
    notifyListeners();
  }

  bool _showLoader = true;
  bool get showLoader => _showLoader;
  set showLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

// Call API for get home details
  getDataInsightsData(BuildContext context, String pageId) async {
    showLoader = true;

    HomeDataModel dataInsightsModel =
        await _api.getDetailDataOfHome(pageId, 'section');

    switch (dataInsightsModel.statusCode) {
      case Constants.sucessCode:
        if (dataInsightsModel.body != null) {
          homeDetails = dataInsightsModel.body;
        }

        break;
      default:
        {
          // ... Your other switch cases ...
        }
        break;
    }

    showLoader = false;
  }
}
