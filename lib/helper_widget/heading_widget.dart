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
      softWrap: false,
      textAlign: TextAlign.center,
      style: AppTheme.lightTheme.textTheme.labelSmall!
          .copyWith(fontSize: AppSize.size16.sp));
}

Widget labelMediumWidget(text, context) {
  return Text(text,
      softWrap: false,
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
          .copyWith(fontSize: AppSize.size40.sp));
}

Widget informationTitleWidget(text, BuildContext context) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.displayMedium!
          .copyWith(fontSize: AppSize.size30.sp));
}

Widget subMenuTitleWidget(text, BuildContext context, bool value) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.displaySmall!.copyWith(
          fontSize: AppSize.size16.sp,
          color: value ? AppColors.whiteColor : AppColors.tabBarSelectedBG));
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
  return Text(text,
      style: AppTheme.lightTheme.textTheme.bodyMedium!
          .copyWith(fontSize: AppSize.size40.sp, fontWeight: FontWeight.w600));
}

Widget subHeaderTextWidget(text, context) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.displayMedium!
          .copyWith(fontSize: AppSize.size30.sp));
}

Widget labelTextForPopUpWidget(text, context) {
  return Text(text,
      softWrap: true,
      style: AppTheme.lightTheme.textTheme.displayLarge!
          .copyWith(fontSize: AppSize.size40.sp));
}

Widget labelTextIndex(text, context) {
  return Text(text,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: AppTheme.lightTheme.textTheme.displaySmall!.copyWith(
        fontSize: AppSize.size18.sp,
        color: AppColors.whiteColor,
      ));
}

Widget buttonText(text, context) {
  return Text(text,
      style: AppTheme.lightTheme.textTheme.bodySmall!
          .copyWith(fontSize: AppSize.size22.sp));
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
        fontFamily: 'Inter',
        fontStyle: FontStyle.normal,
      ),
      "p": Style(
        margin: Margins.zero,
        // padding: HtmlPaddings.zero,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: FontSize(AppSize.size16.sp),
        fontFamily: 'Inter',
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
        fontFamily: 'Inter',
        fontStyle: FontStyle.normal,
      ),
      "p": Style(
        margin: Margins.zero,
        // padding: HtmlPaddings.zero,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontSize: FontSize(AppSize.size16.sp),
        fontFamily: 'Inter',
        fontStyle: FontStyle.normal,
      )
    },
  );
}

Widget pushNotifyWidget(text, context) {
  return Text(text,
      softWrap: true,
      // textAlign: TextAlign.center,
      style: AppTheme.lightTheme.textTheme.titleSmall!.copyWith(
          fontFamily: "Inter",
          fontSize: AppSize.size14.sp,
          color: AppColors.pushNotiyTextColor));
}

Widget notificationNo(text, context) {
  return Text(text,
      softWrap: true,
      style: AppTheme.lightTheme.textTheme.titleSmall!.copyWith(
          fontFamily: "Inter",
          fontSize: AppSize.size18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.pushNotifyNoText));
}
