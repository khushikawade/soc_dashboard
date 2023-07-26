import 'package:flutter/material.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_size.dart';
import 'package:solved_dashboard/utils/app_theme.dart';

Widget titleTextWidget(text, context) {
  return Text(text, style: AppTheme.lightTheme.textTheme.titleMedium);
}

Widget labelSmallWidget(text, context) {
  return Text(text, style: AppTheme.lightTheme.textTheme.labelSmall);
}

Widget labelMediumWidget(text, context) {
  return Text(text, style: AppTheme.lightTheme.textTheme.labelMedium);
}

Widget copyRightTextWidget(text, context) {
  return Text(text, style: AppTheme.lightTheme.textTheme.titleSmall);
}

Widget pageTitleTextWidget(text, context) {
  return Text(text, style: AppTheme.lightTheme.textTheme.titleLarge);
}

Widget informationTitleWidget(text, context) {
  return Text(text, style: AppTheme.lightTheme.textTheme.displayMedium);
}

Widget headerTextWidget(text, context) {
  return Text(text,
      style: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: AppSize.size40,
        fontFamily: 'Inter',
        fontStyle: FontStyle.normal,
      ));
}

Widget subHeaderTextWidget(text, context) {
  return Text(text,
      style: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: AppSize.size30,
        fontFamily: 'Inter',
        fontStyle: FontStyle.normal,
      ));
}

Widget detailTextWidget(text, context) {
  return Text(text,
      style: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: AppSize.size16,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
      ));
}
