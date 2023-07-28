import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_size.dart';
import 'package:solved_dashboard/utils/app_theme.dart';
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

Widget labelTextForPopUpWidget(text, context) {
  return Text(text, style: AppTheme.lightTheme.textTheme.displayLarge);
}

Widget labelTextIndex(text, context) {
  return Text(text,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
        fontSize: AppSize.size18,
        fontFamily: 'Inter',
        fontStyle: FontStyle.normal,
      ));
}

Widget buttonText(text, context) {
  return Text(text,
      style: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: AppSize.size22,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
      ));
}

Widget threeColumnTextWidget(text, context) {
  //return Text(text, style: AppTheme.lightTheme.textTheme.labelSmall);

  return Html(
    data: "$text",
    shrinkWrap: false,
    onLinkTap: (url, attributes, element) {
      AppUtil.urlLauncher(url);
    },
    extensions: [
      TagExtension(tagsToExtend: {"flutter"}, child: const SizedBox.shrink()),
    ],
    style: {
      "body": Style(
        margin: Margins.zero,
        // padding: HtmlPaddings.zero,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: FontSize(AppSize.size18),
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
      ),
      "p": Style(
        margin: Margins.zero,
        // padding: HtmlPaddings.zero,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: FontSize(AppSize.size18),
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
      )
    },
  );
}
