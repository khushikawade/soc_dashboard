import 'package:flutter/material.dart';
import 'package:solved_dashboard/utils/app_size.dart';
import 'package:solved_dashboard/utils/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget titleTextWidget(text, context) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.titleMedium!
          .copyWith(fontSize: AppSize.size26.sp));
}

Widget labelSmallWidget(text, context) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.labelSmall!
          .copyWith(fontSize: AppSize.size16.sp));
}

Widget labelMediumWidget(text, context) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.labelMedium!.copyWith(
        fontSize: AppSize.size25.sp,
      ));
}

Widget copyRightTextWidget(text, context) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.titleSmall!.copyWith(
        fontSize: AppSize.size14.sp,
      ));
}

Widget pageTitleTextWidget(text, context) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.titleLarge!
          .copyWith(fontSize: AppSize.size35.sp));
}

Widget informationTitleWidget(text, BuildContext context) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.displayMedium!
          .copyWith(fontSize: AppSize.size30.sp));
}

Widget subMenuTitleWidget(text, BuildContext context) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.displaySmall!
          .copyWith(fontSize: AppSize.size16.sp));
}

Widget tabBarItemWidgetText(text, context, color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: AppSize.size16.sp,
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
    ),
  );
}
