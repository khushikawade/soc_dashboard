import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class Engagement extends StatefulWidget {
  @override
  _EngagementState createState() => _EngagementState();
}

class _EngagementState extends State<Engagement> {
  @override
  Widget build(Object context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        // padding: EdgeInsets.only(
        //     left: 190.sp, right: 190.sp, top: 36.sp, bottom: 80.sp),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 190.sp, right: 190.sp, top: 40.sp),
            child: pageTitleTextWidget('Push Notification Analytics', context),
          ),
          SizedBox(
            height: 40.h,
          ),
          appsInformationWidget(),
        ],
      ),
    );
  }

  // Make widget that will show apps information
  Widget appsInformationWidget() {
    return Container(
      width: double.infinity,
      height: 335.h,
      decoration: const BoxDecoration(color: AppColors.backgroundBlueColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
