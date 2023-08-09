import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/cached_network_widget.dart';
import 'package:solved_dashboard/helper_widget/common_widget/faq_custom_popup.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/shimmer_loading.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_size.dart';
import 'package:solved_dashboard/utils/app_util.dart';

class AppBarWidget extends StatelessWidget {
  final String? logoURL;
  String? schoolName;
  final String? pageTitle;
  final String? pageViewCount;
  final dynamic onclick;
  final Color? primaryColor;
  final bool? isBusy;

  AppBarWidget({
    this.logoURL,
    this.schoolName,
    this.pageTitle,
    this.pageViewCount,
    this.onclick,
    this.primaryColor,
    this.isBusy,
  });

  @override
  Widget build(BuildContext context) {
    // Use ScreenUtil for responsive design

    return Container(
      padding: EdgeInsets.only(
          left: 192.sp, right: 192.sp, top: 11.sp, bottom: 11.sp),
      decoration: BoxDecoration(
        color: primaryColor ?? AppColors.appPrimaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  AppUtil.dialogBuilder(context);
                },
                child: CustomIconMode(
                  iconUrl: logoURL,
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isBusy!
                      ? ShimmerLoading(
                          isLoading: true,
                          child: Container(
                            height: 20.h,
                            width: 50.w,
                            color: Colors.white,
                          ),
                        )
                      : FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Container(
                            height: 57.h,
                            width: 195.w, // Take the available width
                            child: SelectionArea(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    splitDynamicText(schoolName ?? '')
                                            .isNotEmpty
                                        ? Text(
                                            splitDynamicText(
                                                    schoolName ?? '')[0] ??
                                                '',
                                            softWrap: true,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: AppSize.size22.sp,
                                              fontFamily: 'Inter',
                                              fontStyle: FontStyle.normal,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                    splitDynamicText(schoolName ?? '')
                                            .isNotEmpty
                                        ? Flexible(
                                            fit: FlexFit.loose,
                                            child: Text(
                                              splitDynamicText(
                                                      schoolName ?? '')[1] ??
                                                  '',
                                              softWrap: true,
                                              maxLines: 2,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: AppSize.size18.sp,
                                                fontFamily: 'Inter',
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink()
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )

                  //     fit: BoxFit.scaleDown,
                  //     child: SizedBox(
                  //       width: 191.w,
                  //       // color: Colors.pink,

                  //       child: Align(
                  //         alignment: Alignment.center,
                  //         child: Text(
                  //           schoolName!,
                  //           softWrap: false,
                  //           //maxLines: 2,
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             color: AppColors.whiteColor,
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: AppSize.size25.sp,
                  //             fontFamily: 'Inter',
                  //             fontStyle: FontStyle.normal,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),

                  ,
                  SizedBox(height: 5.h),
                ],
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                titleTextWidget('SOLVED DASHBOARD+', context),
                SizedBox(height: 10.h),
                titleTextWidget('Home', context),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 25.sp, right: 25.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.blueColorBG,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                      ),
                      child: labelSmallWidget('Total Page Views', context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 9.h),
                      child: labelMediumWidget(pageViewCount, context),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.sp),
              Container(
                padding: EdgeInsets.only(
                    left: 25.sp, right: 25.sp, top: 7.h, bottom: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.whiteColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 7.h, bottom: 8.h),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 40.h,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> splitDynamicText(String dynamicText) {
    final numberMatch = RegExp(r'\d+').firstMatch(dynamicText);
    if (numberMatch != null) {
      final index = numberMatch.end;
      final firstPart = dynamicText.substring(0, index);
      final secondPart = dynamicText.substring(index);

      // Find the first non-digit character in the second part
      final nonDigitMatch = RegExp(r'\D').firstMatch(secondPart);
      if (nonDigitMatch != null) {
        final secondIndex = nonDigitMatch.start;
        return [
          firstPart + secondPart.substring(0, secondIndex),
          secondPart.substring(secondIndex),
        ];
      } else {
        return [dynamicText, ''];
      }
    } else {
      return [dynamicText, ''];
    }
  }
}
