import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/rich_text_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

Widget instructionsWidget() {
  return Container(
    width: double.infinity,
    // height: 609.h,
    padding:
        EdgeInsets.only(top: 30.sp, bottom: 43.sp, left: 121.sp, right: 20.sp),
    decoration: BoxDecoration(color: AppColors.backgroundBlueColor, boxShadow: [
      BoxShadow(
        color: AppColors.greyLight.withOpacity(0.1),
        blurRadius: 10.0.r,
        offset: const Offset(0, 3),
        spreadRadius: 0,
      ),
    ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 439.w,
          child: richTextWidget(
              'Your school’s dashboard was developed to make students’ data more accessible, inform classroom instruction, and empower educators to discuss student progress with families.\n\nUse the navigation bar at the top to access the students’ data. If you have any questions, feedback, or updates, please email ',
              '',
              'admin@solvedconsulting.com.',
              ''),
        ),
        SizedBox(
          width: 80.sp,
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Image.asset(
            'assets/dummy.png',
            width: 800.w,
            fit: BoxFit.cover,
          ),
        )
      ],
    ),
  );
}
