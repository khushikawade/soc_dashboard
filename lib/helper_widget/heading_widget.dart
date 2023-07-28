import 'package:flutter/material.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_size.dart';
import 'package:solved_dashboard/utils/app_theme.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:solved_dashboard/utils/app_util.dart';

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
  return Text(text, style: AppTheme.lightTheme.textTheme.bodyMedium);
}

Widget subHeaderTextWidget(text, context) {
  return Text(text, style: AppTheme.lightTheme.textTheme.displayMedium);
}

Widget detailTextWidget(text, context) {
  return Html(
    data: text,
    onLinkTap: (String? url, RenderContext context,
        Map<String, String> attributes, dom.Element? element) {
      AppUtil.urlLauncher(url);
    },
    style: {
      "flutter": Style(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: FontSize(AppSize.size16),
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
      )
    },
  );
}
