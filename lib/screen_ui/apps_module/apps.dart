import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/helper_widget/copy_right_widget.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/models/dashboard_data_model.dart';
import 'package:solved_dashboard/services/models/home_response.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_util.dart';

class Apps extends StatefulWidget {
  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  @override
  Widget build(BuildContext context) {
    HomeList dashboardData =
        Provider.of<DashboardData>(context, listen: false).dashboardData!;
    return ListView(
      children: [
        ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          // padding: EdgeInsets.only(
          //     left: 190.sp, right: 190.sp, top: 36.sp, bottom: 80.sp),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 190.sp, right: 190.sp, top: 40.sp),
              child: pageTitleTextWidget('Apps', context),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
        copyRightWidget('© 2023 Bronx Bears. All Rights Reserved.', context,
            AppUtil.getColorFromHex('')),
      ],
    );
  }
}
