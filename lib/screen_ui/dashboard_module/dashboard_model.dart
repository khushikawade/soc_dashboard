import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/custom_fonts/solved_dashboard_icons_icons.dart';
import 'package:solved_dashboard/models/dashboard_data_model.dart';
import 'package:solved_dashboard/models/nav_bar_model.dart';
import 'package:solved_dashboard/services/api.dart';
import 'package:solved_dashboard/services/models/home_detail_model.dart';
import 'package:solved_dashboard/services/models/home_response.dart';
import 'package:solved_dashboard/utils/app_util.dart';
import 'package:solved_dashboard/utils/constant.dart';
import 'package:solved_dashboard/utils/overrides.dart';
import 'package:vrouter/vrouter.dart';

class ProjectHomeViewModel extends ChangeNotifier {
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

  // String _contactNameC = '';

  // String get contactNameC => _contactNameC;
  // set contactNameC(String contactNameC) {
  //   _contactNameC = contactNameC;
  //   notifyListeners();
  // }

  // String _primaryColorC = '';

  // String get primaryColorC => _primaryColorC;
  // set primaryColorC(String primaryColorC) {
  //   _primaryColorC = primaryColorC;
  //   notifyListeners();
  // }

  String? _menuTitleValue = "Home";

  String? get menuTitleValue => _menuTitleValue;
  set menuTitleValue(String? value) {
    _menuTitleValue = value;
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

  // String _logoURL = '';

  // String get logoURL => _logoURL;
  // set logoURL(String logoURL) {
  //   _logoURL = logoURL;
  //   notifyListeners();
  // }

  bool _showLoader = true;
  bool get showLoader => _showLoader;
  set showLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  // handle Main Section Selection
  void handleTabSelection(
      String sectionName, BuildContext context, String selectedId) {
    final to = context.vRouter.to;
    //Map<String, String> queryParams = {};
    // if (Overrides.SCHOOL_ID.isNotEmpty) {
    //   queryParams['schoolId'] = Overrides.SCHOOL_ID;
    // }
    switch (sectionName) {
      case 'Home':
        return to(Overrides.SCHOOL_ID.isNotEmpty
            ? '/${Overrides.SCHOOL_ID}/Home/$selectedId'
            : '/Home/$selectedId');
      case 'Reports':
        return to(
          Overrides.SCHOOL_ID.isNotEmpty
              ? '/${Overrides.SCHOOL_ID}/Reports'
              : '/Reports',
        );
      case 'Assessments':
        return to(Overrides.SCHOOL_ID.isNotEmpty
            ? '/${Overrides.SCHOOL_ID}/Assessments'
            : '/Assessments');
      case 'Data Insights':
        return to(Overrides.SCHOOL_ID.isNotEmpty
            ? '/${Overrides.SCHOOL_ID}/Data_Insights/$selectedId'
            : '/Data_Insides/$selectedId');
      case 'Apps+':
        return to(Overrides.SCHOOL_ID.isNotEmpty
            ? '/${Overrides.SCHOOL_ID}/Apps/$selectedId'
            : '/Apps/$selectedId');
      case 'Engagement':
        return to(Overrides.SCHOOL_ID.isNotEmpty
            ? '/${Overrides.SCHOOL_ID}/Engagement'
            : '/Engagement');
      case '+ Data':
        return to(Overrides.SCHOOL_ID.isNotEmpty
            ? '/${Overrides.SCHOOL_ID}/Data/$selectedId'
            : '/Data/$selectedId');
      case 'Support':
        return to(Overrides.SCHOOL_ID.isNotEmpty
            ? '/${Overrides.SCHOOL_ID}/Support/$selectedId'
            : '/Support/$selectedId');
    }
  }

  // handle Sub menu selection
  void handleSubSelection(
      String subMenu, String menuTitle, String subTitle, BuildContext context) {
    final to = context.vRouter.to;
    Overrides.SUB_SECTION_MENU = subMenu.replaceAll(" ", "_");
    Overrides.SUB_MENU = subTitle.replaceAll(" ", "_");

    if (menuTitle == "Assessments") {
      to(Overrides.SCHOOL_ID.isNotEmpty
          ? '/${Overrides.SCHOOL_ID}/Assessments/${Overrides.SUB_MENU}/${Overrides.SUB_SECTION_MENU}'
          : '/Assessments');
    }
  }

  // handle Sub menu selection
  void handleSubMenuSelection(
      String subMenu, String menuTitle, BuildContext context) {
    final to = context.vRouter.to;
    Overrides.SUB_MENU = subMenu.replaceAll(" ", "_");

    if (menuTitle == "Reports") {
      to(Overrides.SCHOOL_ID.isNotEmpty
          ? '/${Overrides.SCHOOL_ID}/Reports/${Overrides.SUB_MENU}'
          : '/Reports');
    } else if (menuTitle == "Assessments") {
      to(Overrides.SCHOOL_ID.isNotEmpty
          ? '/${Overrides.SCHOOL_ID}/Assessments/${Overrides.SUB_MENU}'
          : '/Assessments');
    } else if (menuTitle == "Engagement") {
      to(Overrides.SCHOOL_ID.isNotEmpty
          ? '/${Overrides.SCHOOL_ID}/Engagement/${Overrides.SUB_MENU}'
          : '/Engagement');
    } else if (menuTitle == "Support") {
      to(Overrides.SCHOOL_ID.isNotEmpty
          ? '/${Overrides.SCHOOL_ID}/Support/${Overrides.SUB_MENU}'
          : '/Support');
    }
  }

  // // Build Nav bar widget & its items
  // buildNavBar() {
  //   navBarItemList.add(NavBarModel(
  //     title: 'Home',
  //     id: 1,
  //     icon: SolvedDashboardIcons.frame_238,
  //     isSelcted: true,
  //   ));
  //   navBarItemList.add(NavBarModel(
  //       title: 'Reports',
  //       id: 2,
  //       icon: SolvedDashboardIcons.frame_239,
  //       isSelcted: false,
  //       dropDownIcon: Icons.arrow_drop_down,
  //       menuOptions: [
  //         NavBarMenu(
  //           menuTitle: 'Student Report',
  //           id: 1,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //           menuTitle: 'Class Report',
  //           id: 2,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //           menuTitle: 'Report Card',
  //           id: 3,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //           menuTitle: 'School Reports',
  //           id: 4,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //           menuTitle: 'Correlations',
  //           id: 5,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //           menuTitle: 'Dashboard Usage',
  //           id: 6,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //           menuTitle: 'Dashboard Permissions',
  //           id: 7,
  //           isSelected: false,
  //         )
  //       ]));
  //   navBarItemList.add(NavBarModel(
  //       title: 'Assessments',
  //       id: 3,
  //       icon: SolvedDashboardIcons.frame_240,
  //       isSelcted: false,
  //       dropDownIcon: Icons.arrow_drop_down,
  //       menuOptions: [
  //         NavBarMenu(
  //             menuTitle: 'MAP',
  //             id: 1,
  //             isSelected: false,
  //             icon: Icons.arrow_right_outlined,
  //             subMenu: [
  //               SubMenuData(
  //                 subMenuTitle: 'MAP Math',
  //                 id: 1,
  //                 isSelected: false,
  //               ),
  //               SubMenuData(
  //                 subMenuTitle: 'MAP ELA',
  //                 id: 2,
  //                 isSelected: false,
  //               )
  //             ]),
  //         NavBarMenu(
  //             menuTitle: 'iReady',
  //             id: 2,
  //             isSelected: false,
  //             icon: Icons.arrow_right_outlined,
  //             subMenu: [
  //               SubMenuData(
  //                 subMenuTitle: 'iReady Math',
  //                 id: 1,
  //                 isSelected: false,
  //               ),
  //               SubMenuData(
  //                 subMenuTitle: 'iReady ELA',
  //                 id: 2,
  //                 isSelected: false,
  //               )
  //             ]),
  //         NavBarMenu(
  //             menuTitle: 'Acadience',
  //             id: 3,
  //             isSelected: false,
  //             icon: Icons.arrow_right_outlined,
  //             subMenu: [
  //               SubMenuData(
  //                 subMenuTitle: 'Acadience Math',
  //                 id: 1,
  //                 isSelected: false,
  //               ),
  //               SubMenuData(
  //                 subMenuTitle: 'Acadience ELA',
  //                 id: 2,
  //                 isSelected: false,
  //               )
  //             ]),
  //         NavBarMenu(
  //             menuTitle: 'NYS/ISA 2022',
  //             id: 4,
  //             isSelected: false,
  //             icon: Icons.arrow_right_outlined,
  //             subMenu: [
  //               SubMenuData(
  //                 subMenuTitle: 'NYS Math 2022',
  //                 id: 1,
  //                 isSelected: false,
  //               ),
  //               SubMenuData(
  //                 subMenuTitle: 'NYS ELA 2022',
  //                 id: 2,
  //                 isSelected: false,
  //               ),
  //               SubMenuData(
  //                 subMenuTitle: 'ISA Math by Class',
  //                 id: 3,
  //                 isSelected: false,
  //               ),
  //               SubMenuData(
  //                 subMenuTitle: 'ISA ELA by Class',
  //                 id: 4,
  //                 isSelected: false,
  //               ),
  //               SubMenuData(
  //                 subMenuTitle: 'ISA Math by Student',
  //                 id: 5,
  //                 isSelected: false,
  //               ),
  //               SubMenuData(
  //                 subMenuTitle: 'ISA ELA by Student',
  //                 id: 6,
  //                 isSelected: false,
  //               )
  //             ]),
  //         NavBarMenu(
  //           menuTitle: 'F&P',
  //           id: 5,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //           menuTitle: 'DRP',
  //           id: 6,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //           menuTitle: 'SEL',
  //           id: 7,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //             menuTitle: 'June Instructional Report',
  //             id: 8,
  //             isSelected: false,
  //             icon: Icons.arrow_right_outlined,
  //             subMenu: [
  //               SubMenuData(
  //                 subMenuTitle: 'Total Number of Questions',
  //                 id: 1,
  //                 isSelected: false,
  //               ),
  //               SubMenuData(
  //                 subMenuTitle: 'JIR Math',
  //                 id: 2,
  //                 isSelected: false,
  //               ),
  //               SubMenuData(
  //                 subMenuTitle: 'JIR ELA',
  //                 id: 3,
  //                 isSelected: false,
  //               )
  //             ]),
  //       ]));
  //   navBarItemList.add(NavBarModel(
  //     title: 'Data Insights',
  //     id: 4,
  //     icon: SolvedDashboardIcons.frame_241,
  //     isSelcted: false,
  //   ));
  //   navBarItemList.add(NavBarModel(
  //       title: 'Apps+',
  //       id: 5,
  //       icon: SolvedDashboardIcons.frame_245,
  //       isSelcted: false,
  //       dropDownIcon: Icons.arrow_drop_down));
  //   navBarItemList.add(NavBarModel(
  //       title: 'Engagement',
  //       id: 6,
  //       icon: SolvedDashboardIcons.frame_242,
  //       isSelcted: false,
  //       dropDownIcon: Icons.arrow_drop_down,
  //       menuOptions: [
  //         NavBarMenu(
  //           menuTitle: 'App Usage',
  //           id: 1,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //           menuTitle: 'Digital Forms',
  //           id: 2,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //           menuTitle: 'Website Usage',
  //           id: 3,
  //           isSelected: false,
  //         )
  //       ]));
  //   navBarItemList.add(NavBarModel(
  //     title: '+ Data',
  //     id: 7,
  //     icon: SolvedDashboardIcons.frame_243,
  //     isSelcted: false,
  //   ));
  //   navBarItemList.add(NavBarModel(
  //       title: 'Support',
  //       id: 8,
  //       icon: SolvedDashboardIcons.frame_244,
  //       isSelcted: false,
  //       dropDownIcon: Icons.arrow_drop_down,
  //       menuOptions: [
  //         NavBarMenu(
  //           menuTitle: 'HS Dashboard',
  //           id: 1,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //           menuTitle: 'Mobile Dashboard',
  //           id: 2,
  //           isSelected: false,
  //         ),
  //         NavBarMenu(
  //           menuTitle: 'Student Feedback',
  //           id: 3,
  //           isSelected: false,
  //         )
  //       ]));
  // }

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
  getHomeData(BuildContext context) async {
    showLoader = true;
    //String objectName = "School_App__c";

    HomeResponse homeResponse = //a226w000000h58MAAQa--a224W000007pNmDQAU
        await _api.getHomeData(Overrides.SCHOOL_ID);

    print("homeResponse-----------------${homeResponse.statusCode}");
    print(homeResponse.body);
    switch (homeResponse.statusCode) {
      case Constants.sucessCode:
        if (homeResponse.body != null &&
            homeResponse.body!.dashboardSections != null) {
          print("========================there is the data ${homeDataList}");
          saveDashboardData(homeResponse.body, context);

          for (int i = 0;
              i < homeResponse.body!.dashboardSections!.length;
              i++) {
            String sectionTitle =
                homeResponse.body!.dashboardSections![i].dashboardSectionC!;
            List<DashboardSubSection>? subSections =
                homeResponse.body!.dashboardSections![i].dashboardSubSections;
            if (sectionTitle == "Home") {
              HomeDataModel homeDataModelRes = await _api.getDetailDataOfHome(
                  "a436w0000003iv3AAA"
                  //homeResponse.body!.dashboardSections![i].id
                  //?? ''
                  ,
                  "section");
              if (homeDataModelRes.body != null) {
                //============================saving home tab details ============
                saveDashboardDataOfHome(homeDataModelRes.body, context);
              }
            }
            // Initialize subMenuOptions list for the current section
            List<NavBarMenu> subMenuOptions = [];

            if (subSections != null && subSections.isNotEmpty) {
              for (int j = 0; j < subSections.length; j++) {
                List<DashboardSubSubSection>? subSubSections =
                    subSections[j].dashboardSubSubSections;
                print(
                    "============>>>>>>>>>>>>subsection[$j]${subSubSections}");
                print(
                    "============>>>>>>>>>>>>subsection[$j]${subSubSections}");
                bool subListExist =
                    subSubSections != null && subSubSections.isNotEmpty;

                subMenuOptions.add(NavBarMenu(
                  menuTitle:
                      subSections.isEmpty ? "" : subSections[j].subSectionC,
                  subMenu: [],
                  isSelected: false,
                  // icon: subListExist
                  //     ? Icons.arrow_drop_down
                  //     : const IconData(0, fontFamily: 'EmptyIconFont'),
                ));
              }
            }

            // Check if the section title already exists
            // bool isTitleExists =
            //     navBarItemList.any((item) => item.title == sectionTitle);
            // if (!isTitleExists) {
            IconData sectionIcon = getIconForSectionTitle(sectionTitle);
            navBarItemList.add(NavBarModel(
              title: sectionTitle,
              sortOrder: int.parse(
                  homeResponse.body!.dashboardSections![i].sortOrder!),
              id: homeResponse.body!.dashboardSections![i].id!,
              icon: sectionIcon,
              isSelcted: sectionTitle == "Home" ? true : false,
              menuOptions: subMenuOptions,
              dropDownIcon: subMenuOptions.isNotEmpty
                  ? Icons.arrow_drop_down
                  : const IconData(0, fontFamily: 'EmptyIconFont'),
            ));
            // }
          }
        }

        navBarItemList = navBarItemList.toList();

        navBarItemList.sort((a, b) {
          return a.sortOrder!.compareTo(b.sortOrder!);
        });

        print(navBarItemList);

        break;
      default:
        {
          // ... Your other switch cases ...
        }
        break;
    }

    showLoader = false;
  }

  // Save user local data
  saveDashboardData(HomeList? data, BuildContext context) async {
    Provider.of<DashboardData>(context, listen: false).setDashBoardData(data);
  }

  // Save user local data FOR Home
  saveDashboardDataOfHome(HomDetail? data, BuildContext context) async {
    Provider.of<DashboardData>(context, listen: false).setHomeDetail(data);
  }

  // Define a function to determine the icon based on section title
  IconData getIconForSectionTitle(String sectionTitle) {
    if (sectionTitle == 'Home') {
      return SolvedDashboardIcons.frame_238; // Replace with the desired icon
    } else if (sectionTitle == "Reports") {
      return SolvedDashboardIcons
          .frame_239; // Replace with another desired icon
    } else if (sectionTitle == 'Assessments') {
      return SolvedDashboardIcons.frame_240;
    } else if (sectionTitle == "Data Insights") {
      return SolvedDashboardIcons.frame_241;
    } else if (sectionTitle == 'Apps+') {
      return SolvedDashboardIcons.frame_245;
    } else if (sectionTitle == 'Engagement') {
      return SolvedDashboardIcons.frame_242;
    } else if (sectionTitle == '+ Data') {
      return SolvedDashboardIcons.frame_243;
    } else if (sectionTitle == 'Support') {
      return SolvedDashboardIcons.frame_244;
    } else if (sectionTitle == "Live Chat") {
      return SolvedDashboardIcons.frame_245;
    } else {
      return SolvedDashboardIcons.frame_245; // Replace with a default icon
    }
  }
}
