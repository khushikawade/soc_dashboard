import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

Widget loadingWidget(BuildContext context) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: AppColors.whiteColor,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          strokeWidth: 3,
          valueColor:
              AlwaysStoppedAnimation<Color>(AppColors.linkUnderlineColor),
        ),
        SizedBox(
          height: 16.h,
        ),
        labelMediumWidget('Loading, Please wait...', context)
      ],
    ),
  );
}
