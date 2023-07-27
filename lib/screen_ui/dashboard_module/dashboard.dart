import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/app_bar_widget.dart';
import 'package:solved_dashboard/helper_widget/copy_right_widget.dart';
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
        // mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Home(),
        ],
      ),
      //body: Engagement(),
    );
  }
}
