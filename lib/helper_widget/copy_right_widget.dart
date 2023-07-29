import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_util.dart';

Widget copyRightWidget(message, BuildContext context) {
  return Container(
    width: double.infinity,
    height: 79.h,
    color: AppColors.appPrimaryColor,
    alignment: Alignment.center,
    child: copyRightTextWidget(message, context),
  );
}
