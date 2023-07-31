import 'package:flutter/material.dart';
import 'package:solved_dashboard/services/api.dart';
import 'package:solved_dashboard/services/models/home_response.dart';
import 'package:solved_dashboard/utils/constant.dart';

class ProjectHomeViewModel extends ChangeNotifier {
  final Api _api = Api();

  String _schoolId = '';

  String get schoolId => _schoolId;
  set schoolId(String id) {
    _schoolId = id;
    notifyListeners();
  }

  List<HomeList> _homeDataList = List.empty(growable: true);

  List<HomeList> get homeDataList => _homeDataList;
  set homeDataList(List<HomeList> homeDataList) {
    _homeDataList = homeDataList;
    notifyListeners();
  }

  String _contactNameC = '';

  String get contactNameC => _contactNameC;
  set contactNameC(String contactNameC) {
    _contactNameC = contactNameC;
    notifyListeners();
  }

  String _primaryColorC = '';

  String get primaryColorC => _primaryColorC;
  set primaryColorC(String primaryColorC) {
    _primaryColorC = primaryColorC;
    notifyListeners();
  }

  String _logoURL = '';

  String get logoURL => _logoURL;
  set logoURL(String logoURL) {
    _logoURL = logoURL;
    notifyListeners();
  }

  bool _showLoader = false;
  bool get showLoader => _showLoader;
  set showLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  String extractIdFromUrl(String url) {
    Uri uri = Uri.parse(url);
    String path = uri.path;
    List<String> pathSegments = path.split('/');
    if (pathSegments.length >= 2) {
      String id = pathSegments[1];
      print("extrat id ------------$id");
      schoolId = id;
      return id;
    }
    return ""; // Return an empty string if no valid ID is found.
  }

  // Call API for get home details
  getHomeData() async {
    String objectName = "School_App__c";

    HomeResponse homeResponse = await _api.getHomeData(schoolId, objectName);

    print("homeResponse-----------------${homeResponse.statusCode}");
    print(homeResponse.body);
    switch (homeResponse.statusCode) {
      case Constants.sucessCode:
        if (homeResponse.body != null && homeResponse.body!.isNotEmpty) {
          homeDataList.addAll(homeResponse.body!);
        }
        for (int i = 0; i < homeDataList.length; i++) {
          if (homeDataList[i].contactNameC != null &&
              homeDataList[i].contactNameC!.isNotEmpty) {
            contactNameC = homeDataList[i].contactNameC.toString();
          }
          if (homeDataList[i].primaryColorC != null &&
              homeDataList[i].primaryColorC!.isNotEmpty) {
            primaryColorC = homeDataList[i].primaryColorC.toString();
            print(primaryColorC);
          }
          if (homeDataList[i].fullLogoC != null &&
              homeDataList[i].fullLogoC!.isNotEmpty) {
            logoURL = homeDataList[i].fullLogoC.toString();
          }
        }

        break;
      case Constants.wrongError:
        // AppUtil.showDialogbox(AppUtil.getContext(),
        //     locationApiResponse.error ?? 'Oops Something went wrong');

        break;

      case Constants.networkErroCode:
        // AppUtil.showDialogbox(AppUtil.getContext(),
        //     locationApiResponse.error ?? 'Oops Something went wrong');

        break;
      default:
        {
          // if (locationApiResponse.error != null &&
          //     locationApiResponse.error!.isNotEmpty) {
          //   AppUtil.showDialogbox(AppUtil.getContext(),
          //       locationApiResponse.error ?? 'Oops Something went wrong');
          // }
        }
        break;
    }

    // showLocationLoader = false;
  }

  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    final int hexValue = int.parse(hexColor, radix: 16);
    return Color(hexValue | 0xFF000000); // Add alpha value (opaque)
  }
}
