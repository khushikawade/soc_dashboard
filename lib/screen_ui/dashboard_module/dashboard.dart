import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/custom_fonts/solved_dashboard_icons_icons.dart';
import 'package:solved_dashboard/helper_widget/app_bar_widget.dart';
import 'package:solved_dashboard/helper_widget/copy_right_widget.dart';
import 'package:solved_dashboard/helper_widget/hover_animation_widget.dart';
import 'package:solved_dashboard/helper_widget/tabbar_item_widget.dart';
import 'package:solved_dashboard/helper_widget/vertical_divider_widget.dart';
import 'package:solved_dashboard/screen_ui/home_module/home.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

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
        isSelected: false),
    Menu(
        id: 5,
        name: 'Assessments',
        iconName: SolvedDashboardIcons.frame_240,
        isSelected: false),
    Menu(
        id: 3,
        name: 'Data Insights',
        iconName: SolvedDashboardIcons.frame_241,
        isSelected: false),
    Menu(
        id: 4,
        name: 'Apps+',
        iconName: SolvedDashboardIcons.frame_245,
        isSelected: false),
    Menu(
        id: 5,
        name: 'Engagement',
        iconName: SolvedDashboardIcons.frame_242,
        isSelected: false),
    Menu(
        id: 5,
        name: '+ Data',
        iconName: SolvedDashboardIcons.frame_243,
        isSelected: false),
    Menu(
        id: 5,
        name: 'Support',
        iconName: SolvedDashboardIcons.frame_244,
        isSelected: false),
  }.toList();

  List<SubMenu> menuModelList = {
    SubMenu(id: 1, name: 'App Usage'),
    SubMenu(id: 2, name: 'Digital Forms'),
    SubMenu(id: 3, name: 'Website Usage'),
  }.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBGColor,
      //bottomSheet: copyRightWidget('© 2023 Bronx Bears. All Rights Reserved.'),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(400.h),
          child: const AppBarWidget(
            logoURL:
                'https://solved-schools.s3.us-east-2.amazonaws.com/BB-P.S.+456+Bronx-Bears/app-logos/Bronx+Bears+1024.png',
            pageViewCount: '2,444',
          )),
      body: Column(
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
                copyRightWidget(
                    '© 2023 Bronx Bears. All Rights Reserved.', context),
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
