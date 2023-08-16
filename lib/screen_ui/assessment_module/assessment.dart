import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/helper_widget/common_widget/three_column_text_and_image.dart';
import 'package:solved_dashboard/helper_widget/copy_right_widget.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/models/dashboard_data_model.dart';
import 'package:solved_dashboard/services/models/home_response.dart';
import 'package:solved_dashboard/utils/app_util.dart';

class Assessment extends StatefulWidget {
  @override
  _AssessmentState createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  @override
  Widget build(BuildContext context) {
    HomeList dashboardData =
        Provider.of<DashboardData>(context, listen: false).dashboardData!;
    return ListView(
      children: [
        ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
              left: 190.sp, right: 190.sp, top: 36.sp, bottom: 80.sp),
          children: [
            pageTitleTextWidget('Latest Dashboard Features', context),
            SizedBox(
              height: 42.h,
            ),
          ],
        ),
        copyRightWidget(
          '© 2023 Bronx Bears. All Rights Reserved.',
          context,
          AppUtil.getColorFromHex(dashboardData.account != null &&
                  dashboardData.account!.schoolApp != null
              ? dashboardData.account!.schoolApp!.primaryColorC != null
                  ? dashboardData.account!.schoolApp!.primaryColorC.toString()
                  : ''
              : ''),
        ),
      ],
    );
  }
}
//-----------------