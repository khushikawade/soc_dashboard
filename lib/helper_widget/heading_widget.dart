import 'package:flutter/material.dart';
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

Widget tabBarItemWidgetText(text, context, color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: AppSize.size16,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
    ),
  );
}
