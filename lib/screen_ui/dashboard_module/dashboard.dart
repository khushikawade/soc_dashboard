import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/custom_fonts/solved_dashboard_icons_icons.dart';
import 'package:solved_dashboard/helper_widget/app_bar_widget.dart';
import 'package:solved_dashboard/helper_widget/copy_right_widget.dart';
import 'package:solved_dashboard/helper_widget/tabbar_item_widget.dart';
import 'package:solved_dashboard/helper_widget/vertical_divider_widget.dart';
import 'package:solved_dashboard/screen_ui/engegment_module/engegment.dart';
import 'package:solved_dashboard/screen_ui/home_module/home.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBGColor,
      bottomSheet: copyRightWidget('© 2023 Bronx Bears. All Rights Reserved.'),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(500.h),
          child: const AppBarWidget(
            logoURL:
                'https://solved-schools.s3.us-east-2.amazonaws.com/BB-P.S.+456+Bronx-Bears/app-logos/Bronx+Bears+1024.png',
            pageViewCount: '2,444',
          )),
      body: ListView(
        shrinkWrap: true,
        children: [
          tabBarView(),
          SizedBox(
            height: 36.h,
          ),
          Home(),
        ],
      ),
      //body: Engagement(),
    );
  }

  // Make widget that will create custom tabbar view
  Widget tabBarView() {
    return Container(
      margin: EdgeInsets.only(left: 190.sp, right: 190.sp, top: 36.sp),
      width: double.infinity,
      //height: 74.h,
      decoration: BoxDecoration(color: AppColors.whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          tabBarItemWidget(
            'Home',
            true,
            SolvedDashboardIcons.frame_238,
          ),
          verticalDivider(),
          tabBarItemWidget('Reports', false, SolvedDashboardIcons.frame_239,
              dropDownIcon: Icons.arrow_drop_down),
          verticalDivider(),
          tabBarItemWidget('Assessments', false, SolvedDashboardIcons.frame_240,
              dropDownIcon: Icons.arrow_drop_down),
          verticalDivider(),
          tabBarItemWidget(
            'Data Insights',
            false,
            SolvedDashboardIcons.frame_241,
          ),
          verticalDivider(),
          tabBarItemWidget('Apps+', false, SolvedDashboardIcons.frame_245,
              dropDownIcon: Icons.arrow_drop_down),
          verticalDivider(),
          tabBarItemWidget('Engagement', false, SolvedDashboardIcons.frame_242,
              dropDownIcon: Icons.arrow_drop_down),
          verticalDivider(),
          tabBarItemWidget(
            '+ Data',
            false,
            SolvedDashboardIcons.frame_243,
          ),
          verticalDivider(),
          tabBarItemWidget('Support', false, SolvedDashboardIcons.frame_244,
              dropDownIcon: Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
