import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_util.dart';

Widget informationGraphCard(String title, String permission, String imagePath) {
  return Container(
    padding:
        EdgeInsets.only(top: 51.sp, bottom: 19.sp, left: 21.sp, right: 21.sp),
    decoration: BoxDecoration(color: AppColors.whiteColor, boxShadow: [
      BoxShadow(
        color: AppColors.black.withOpacity(0.1),
        blurRadius: 20.0.r,
        offset: const Offset(0, 20),
        spreadRadius: 0,
      ),
    ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        informationTitleWidget(title, AppUtil.getContext()),
        SizedBox(
          height: 53.h,
        ),
        Image.asset(
          imagePath,
          // height: 332.h,
          // width: 443.w,
          // fit: BoxFit.cover,
        )
      ],
    ),
  );
}
