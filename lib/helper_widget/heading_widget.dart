import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_size.dart';
import 'package:solved_dashboard/utils/app_theme.dart';
// import 'package:flutter_html/flutter_html.dart';

import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_size.dart';
import 'package:solved_dashboard/utils/app_theme.dart';
import 'package:solved_dashboard/utils/app_util.dart';

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

Widget headerTextWidget(text, context) {
  return Text(text, style: AppTheme.lightTheme.textTheme.bodyMedium);
}

Widget subHeaderTextWidget(text, context) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.displayMedium!
          .copyWith(fontSize: AppSize.size30.sp));
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
    shrinkWrap: true,
    onLinkTap: (url, attributes, element) {
      AppUtil.urlLauncher(url);
    },
    extensions: [
      TagExtension(tagsToExtend: {"flutter"}, child: const SizedBox.shrink()),
    ],
    style: {
      "body": Style(
        margin: Margins.zero,
        alignment: Alignment.center,
        // padding: HtmlPaddings.zero,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: FontSize(AppSize.size16.sp),
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
      ),
      "p": Style(
        margin: Margins.zero,
        // padding: HtmlPaddings.zero,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: FontSize(AppSize.size16.sp),
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
      )
    },
  );
}

Widget detailTextWidget(text, context) {
  //return Text(text, style: AppTheme.lightTheme.textTheme.labelSmall);

  return Html(
    data: "$text",
    shrinkWrap: true,
    onLinkTap: (url, attributes, element) {
      AppUtil.urlLauncher(url);
    },
    extensions: [
      TagExtension(tagsToExtend: {"flutter"}, child: const SizedBox.shrink()),
    ],
    style: {
      "body": Style(
        margin: Margins.zero,
        alignment: Alignment.center,
        // padding: HtmlPaddings.zero,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: FontSize(AppSize.size16.sp),
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
      ),
      "p": Style(
        margin: Margins.zero,
        // padding: HtmlPaddings.zero,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: FontSize(AppSize.size16.sp),
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
      )
    },
  );
}

Widget pushNotifyWidget(text, context) {
  return Flexible(
    child: Text(text,
        maxLines: 2,
        style: AppTheme.lightTheme.textTheme.titleSmall!.copyWith(
            fontFamily: "Poppins",
            fontSize: AppSize.size14.sp,
            color: AppColors.pushNotiyTextColor)),
  );
}

Widget notificationNo(text, context) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.titleSmall!.copyWith(
          fontFamily: "Poppins",
          fontSize: AppSize.size18.sp,
          color: AppColors.pushNotifyNoText));
}
