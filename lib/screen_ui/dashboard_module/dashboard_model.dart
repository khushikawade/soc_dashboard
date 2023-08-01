import 'package:flutter/material.dart';
import 'package:solved_dashboard/custom_fonts/solved_dashboard_icons_icons.dart';
import 'package:solved_dashboard/models/nav_bar_model.dart';
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

  List<NavBarModel> _navBarItemList = List.empty(growable: true);

  List<NavBarModel> get navBarItemList => _navBarItemList;
  set navBarItemList(List<NavBarModel> list) {
    _navBarItemList = list;
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

  // Build Nav bar widget & its items
  buildNavBar() {
    navBarItemList.add(NavBarModel(
      title: 'Home',
      id: 1,
      icon: SolvedDashboardIcons.frame_238,
      isSelcted: false,
    ));
    navBarItemList.add(NavBarModel(
        title: 'Reports',
        id: 2,
        icon: SolvedDashboardIcons.frame_239,
        isSelcted: false,
        dropDownIcon: Icons.arrow_drop_down,
        menuOptions: [
          NavBarMenu(
            menuTitle: 'Student Report',
            id: 1,
            isSelected: false,
          ),
          NavBarMenu(
            menuTitle: 'Class Report',
            id: 2,
            isSelected: false,
          ),
          NavBarMenu(
            menuTitle: 'Report Card',
            id: 3,
            isSelected: false,
          ),
          NavBarMenu(
            menuTitle: 'School Reports',
            id: 4,
            isSelected: false,
          ),
          NavBarMenu(
            menuTitle: 'Correlations',
            id: 5,
            isSelected: false,
          ),
          NavBarMenu(
            menuTitle: 'Dashboard Usage',
            id: 6,
            isSelected: false,
          ),
          NavBarMenu(
            menuTitle: 'Dashboard Permissions',
            id: 7,
            isSelected: false,
          )
        ]));
    navBarItemList.add(NavBarModel(
        title: 'Assessments',
        id: 3,
        icon: SolvedDashboardIcons.frame_240,
        isSelcted: false,
        dropDownIcon: Icons.arrow_drop_down,
        menuOptions: [
          NavBarMenu(
              menuTitle: 'MAP',
              id: 1,
              isSelected: false,
              icon: Icons.arrow_right_outlined,
              subMenu: [
                SubMenuData(
                  subMenuTitle: 'MAP Math',
                  id: 1,
                  isSelected: false,
                ),
                SubMenuData(
                  subMenuTitle: 'MAP ELA',
                  id: 2,
                  isSelected: false,
                )
              ]),
          NavBarMenu(
              menuTitle: 'iReady',
              id: 2,
              isSelected: false,
              icon: Icons.arrow_right_outlined,
              subMenu: [
                SubMenuData(
                  subMenuTitle: 'iReady Math',
                  id: 1,
                  isSelected: false,
                ),
                SubMenuData(
                  subMenuTitle: 'iReady ELA',
                  id: 2,
                  isSelected: false,
                )
              ]),
          NavBarMenu(
              menuTitle: 'Acadience',
              id: 3,
              isSelected: false,
              icon: Icons.arrow_right_outlined,
              subMenu: [
                SubMenuData(
                  subMenuTitle: 'Acadience Math',
                  id: 1,
                  isSelected: false,
                ),
                SubMenuData(
                  subMenuTitle: 'Acadience ELA',
                  id: 2,
                  isSelected: false,
                )
              ]),
          NavBarMenu(
              menuTitle: 'NYS / ISA 2022',
              id: 4,
              isSelected: false,
              icon: Icons.arrow_right_outlined,
              subMenu: [
                SubMenuData(
                  subMenuTitle: 'NYS Math 2022',
                  id: 1,
                  isSelected: false,
                ),
                SubMenuData(
                  subMenuTitle: 'NYS ELA 2022',
                  id: 2,
                  isSelected: false,
                ),
                SubMenuData(
                  subMenuTitle: 'ISA Math by Class',
                  id: 3,
                  isSelected: false,
                ),
                SubMenuData(
                  subMenuTitle: 'ISA ELA by Class',
                  id: 4,
                  isSelected: false,
                ),
                SubMenuData(
                  subMenuTitle: 'ISA Math by Student',
                  id: 5,
                  isSelected: false,
                ),
                SubMenuData(
                  subMenuTitle: 'ISA ELA by Student',
                  id: 6,
                  isSelected: false,
                )
              ]),
          NavBarMenu(
            menuTitle: 'F&P',
            id: 5,
            isSelected: false,
          ),
          NavBarMenu(
            menuTitle: 'DRP',
            id: 6,
            isSelected: false,
          ),
          NavBarMenu(
            menuTitle: 'SEL',
            id: 7,
            isSelected: false,
          ),
          NavBarMenu(
              menuTitle: 'June Instructional Report',
              id: 8,
              isSelected: false,
              icon: Icons.arrow_right_outlined,
              subMenu: [
                SubMenuData(
                  subMenuTitle: 'Total Number of Questions',
                  id: 1,
                  isSelected: false,
                ),
                SubMenuData(
                  subMenuTitle: 'JIR Math',
                  id: 2,
                  isSelected: false,
                ),
                SubMenuData(
                  subMenuTitle: 'JIR ELA',
                  id: 3,
                  isSelected: false,
                )
              ]),
        ]));
    navBarItemList.add(NavBarModel(
      title: 'Data Insights',
      id: 4,
      icon: SolvedDashboardIcons.frame_241,
      isSelcted: false,
    ));
    navBarItemList.add(NavBarModel(
        title: 'Apps+',
        id: 5,
        icon: SolvedDashboardIcons.frame_245,
        isSelcted: false,
        dropDownIcon: Icons.arrow_drop_down));
    navBarItemList.add(NavBarModel(
        title: 'Engagement',
        id: 6,
        icon: SolvedDashboardIcons.frame_242,
        isSelcted: false,
        dropDownIcon: Icons.arrow_drop_down,
        menuOptions: [
          NavBarMenu(
            menuTitle: 'App Usage',
            id: 1,
            isSelected: false,
          ),
          NavBarMenu(
            menuTitle: 'Digital Forms',
            id: 2,
            isSelected: false,
          ),
          NavBarMenu(
            menuTitle: 'Website Usage',
            id: 3,
            isSelected: false,
          )
        ]));
    navBarItemList.add(NavBarModel(
      title: '+ Data',
      id: 7,
      icon: SolvedDashboardIcons.frame_243,
      isSelcted: false,
    ));
    navBarItemList.add(NavBarModel(
        title: 'Support',
        id: 8,
        icon: SolvedDashboardIcons.frame_244,
        isSelcted: false,
        dropDownIcon: Icons.arrow_drop_down,
        menuOptions: [
          NavBarMenu(
            menuTitle: 'HS Dashboard',
            id: 1,
            isSelected: false,
          ),
          NavBarMenu(
            menuTitle: 'Mobile Dashboard',
            id: 2,
            isSelected: false,
          ),
          NavBarMenu(
            menuTitle: 'Student Feedback',
            id: 3,
            isSelected: false,
          )
        ]));
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
    showLoader = true;
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

    showLoader = false;
  }

  Color getColorFromHex(String hexColor) {
    if (hexColor.isNotEmpty) {
      hexColor = hexColor.replaceAll("#", "");
      final int hexValue = int.parse(hexColor, radix: 16);
      return Color(hexValue | 0xFF000000); // Add alpha value (opaque)
    } else {
      return const Color(0xFF000000);
    }
  }
}
