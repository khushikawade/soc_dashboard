import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/custom_fonts/solved_dashboard_icons_icons.dart';
import 'package:solved_dashboard/helper_widget/app_bar_widget.dart';
import 'package:solved_dashboard/helper_widget/copy_right_widget.dart';
import 'package:solved_dashboard/helper_widget/hover_animation_widget.dart';
import 'package:solved_dashboard/helper_widget/loading_widget.dart';
import 'package:solved_dashboard/helper_widget/shimmer_loading.dart';
import 'package:solved_dashboard/helper_widget/tabbar_item_widget.dart';
import 'package:solved_dashboard/helper_widget/vertical_divider_widget.dart';
import 'package:solved_dashboard/routers/route_constants.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard_model.dart';
import 'package:solved_dashboard/screen_ui/home_module/home.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_theme.dart';

import '../../helper_widget/common_widget/push_notifcation_card.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Menu> headerModelList = {
    Menu(
        id: 1,
        name: 'Home',
        iconName: SolvedDashboardIcons.frame_238,
        isSelected: true),
    Menu(
        id: 2,
        name: 'Reports',
        iconName: SolvedDashboardIcons.frame_239,
        isSelected: false,
        dropDownIcon: Icons.arrow_drop_down),
    Menu(
        id: 5,
        name: 'Assessments',
        iconName: SolvedDashboardIcons.frame_240,
        isSelected: false,
        dropDownIcon: Icons.arrow_drop_down),
    Menu(
        id: 3,
        name: 'Data Insights',
        iconName: SolvedDashboardIcons.frame_241,
        isSelected: false),
    Menu(
        id: 4,
        name: 'Apps+',
        iconName: SolvedDashboardIcons.frame_245,
        isSelected: false,
        dropDownIcon: Icons.arrow_drop_down),
    Menu(
        id: 5,
        name: 'Engagement',
        iconName: SolvedDashboardIcons.frame_242,
        isSelected: false,
        dropDownIcon: Icons.arrow_drop_down),
    Menu(
        id: 5,
        name: '+ Data',
        iconName: SolvedDashboardIcons.frame_243,
        isSelected: false),
    Menu(
        id: 5,
        name: 'Support',
        iconName: SolvedDashboardIcons.frame_244,
        isSelected: false,
        dropDownIcon: Icons.arrow_drop_down),
  }.toList();

  List<SubMenu> menuModelList = {
    SubMenu(id: 1, name: 'App Usage', imagePath: 'assets/app_usage.png'),
    SubMenu(
        id: 2, name: 'Digital Forms', imagePath: 'assets/digital_forms.png'),
    SubMenu(
        id: 3, name: 'Website Usage', imagePath: 'assets/webside_usage.png'),
  }.toList();

  @override
  void initState() {
    super.initState();
    String url = RouteConstants.homeRoute;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final projectHomeViewModel =
          Provider.of<ProjectHomeViewModel>(context, listen: false);
      projectHomeViewModel.extractIdFromUrl(url);
      projectHomeViewModel.getHomeData();
    });
  }

  Widget build(BuildContext context) {
    final projectHomeViewModel = Provider.of<ProjectHomeViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      //bottomSheet: copyRightWidget('© 2023 Bronx Bears. All Rights Reserved.'),
      appBar: projectHomeViewModel.showLoader
          ? AppBar(
              toolbarHeight: 0,
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(400.h),
              child:
                  // projectHomeViewModel.showLoader
                  //     ? loadingWidget(context)
                  //     // ShimmerLoading(
                  //     //     isLoading: projectHomeViewModel.showLoader,
                  //     //     child: Container(
                  //     //       height: 129.h,
                  //     //       width: double.infinity,
                  //     //       color: Colors.white,
                  //     //     ),
                  //     //   )
                  //     :
                  AppBarWidget(
                      logoURL: projectHomeViewModel.logoURL ?? '',
                      pageViewCount: '2,444',
                      schoolName: projectHomeViewModel.contactNameC,
                      isBusy: projectHomeViewModel.showLoader,
                      primaryColor: projectHomeViewModel.getColorFromHex(
                          projectHomeViewModel.primaryColorC))),
      body: projectHomeViewModel.showLoader
          ? loadingWidget(context)
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              //shrinkWrap: true,
              children: [
                menu(),
                //tabBarView(),
                SizedBox(
                  height: 36.h,
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Home(),
                      // PushNotificationCustomCard(
                      //   icon1: "assets/group_19036.png",
                      //   icon2: "assets/group_19037.png",
                      //   icon3: "assets/group_19038.png",
                      //   icon4: "assets/group_19039.png",
                      //   notificationText1: 'Current App Users',
                      //   notificationText2: 'Push Notifications Sent',
                      //   notificationText3: 'Push Notification\nEngagements',
                      //   notificationText4: 'In-App Social \nEngagements',
                      //   subNotificationText1: "262626",
                      //   subNotificationText2: "10,253",
                      //   subNotificationText3: "11,045",
                      //   subNotificationText4: "18,126",
                      // ),
                      projectHomeViewModel.showLoader
                          ? ShimmerLoading(
                              isLoading: projectHomeViewModel.showLoader,
                              child: Container(
                                height: 79.h,
                                width: double.infinity,
                                color: Colors.white,
                              ),
                            )
                          : copyRightWidget(
                              '© 2023 Bronx Bears. All Rights Reserved.',
                              context,
                              projectHomeViewModel.getColorFromHex(
                                  projectHomeViewModel.primaryColorC)),
                    ],
                  ),
                )
              ],
            ),
      //body: Engagement(),
    );
  }

  Widget menu() {
    return Container(
      margin: EdgeInsets.only(left: 190.sp, right: 190.sp, top: 36.sp),
      width: double.infinity,
      height: 74.h,
      decoration: BoxDecoration(color: AppColors.whiteColor),
      child: AnimatedHoverMenu(
        headerPosition: HeaderPosition.topLeft,
        headerTiles: headerModelList,
        menuTiles: menuModelList,
        headerBoxDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            color: Color(0xff996617)),
        headerTextColor: Colors.white,
        headerTextSize: 15.0,
        menuBoxDecoration: const BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: Color(0xff996617), width: 2),
          ),
        ),
        menuTextColor: const Color(0xff996617),
        animationType: AnimationType.springAcrossAxis,
        menuTextSize: 16.0,
      ),
    );
  }

  // Make widget that will create custom tabbar view
  Widget tabBarView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 190.sp, right: 190.sp, top: 36.sp),
          width: double.infinity,
          height: 74.h,
          decoration: BoxDecoration(color: AppColors.whiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: tabBarItemWidget(
                    'Home', true, SolvedDashboardIcons.frame_238, context),
              ),
              verticalDivider(),
              Expanded(
                child: tabBarItemWidget(
                    'Reports', false, SolvedDashboardIcons.frame_239, context,
                    dropDownIcon: Icons.arrow_drop_down),
              ),
              verticalDivider(),
              Expanded(
                  child: tabBarItemWidget('Assessments', false,
                      SolvedDashboardIcons.frame_240, context,
                      dropDownIcon: Icons.arrow_drop_down)),
              verticalDivider(),
              Expanded(
                child: tabBarItemWidget(
                  'Data Insights',
                  false,
                  SolvedDashboardIcons.frame_241,
                  context,
                ),
              ),
              verticalDivider(),
              Expanded(
                child: tabBarItemWidget(
                    'Apps+', false, SolvedDashboardIcons.frame_245, context,
                    dropDownIcon: Icons.arrow_drop_down),
              ),
              verticalDivider(),
              Expanded(
                child: tabBarItemWidget('Engagement', false,
                    SolvedDashboardIcons.frame_242, context,
                    dropDownIcon: Icons.arrow_drop_down),
              ),
              verticalDivider(),
              Expanded(
                child: tabBarItemWidget(
                  '+ Data',
                  false,
                  SolvedDashboardIcons.frame_243,
                  context,
                ),
              ),
              verticalDivider(),
              Expanded(
                child: tabBarItemWidget(
                    'Support', false, SolvedDashboardIcons.frame_244, context,
                    dropDownIcon: Icons.arrow_drop_down),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
