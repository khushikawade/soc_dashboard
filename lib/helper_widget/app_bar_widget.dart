import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/cached_network_widget.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/hover_animation_widget.dart';
import 'package:solved_dashboard/helper_widget/shimmer_loading.dart';
import 'package:solved_dashboard/models/nav_bar_model.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard_model.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_size.dart';
import 'package:solved_dashboard/utils/app_util.dart';

class AppBarWidget extends StatelessWidget {
  final String? logoURL;
  final String? schoolName;
  final String? pageTitle;
  final String? pageViewCount;
  final dynamic onclick;
  final Color? primaryColor;
  final bool? isBusy;
  final BuildContext? context;
  List<NavBarModel>? sectionList = [];
  final ProjectHomeViewModel? model;

  AppBarWidget(
      {this.logoURL,
      this.schoolName,
      this.pageTitle,
      this.pageViewCount,
      this.onclick,
      this.primaryColor,
      this.isBusy,
      this.context,
      this.sectionList,
      this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(
              left: 192.sp, right: 192.sp, top: 11.sp, bottom: 11.sp),
          decoration: BoxDecoration(
            color: primaryColor ?? AppColors.appPrimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      AppUtil.dialogBuilder(context);
                    },
                    child: CustomIconMode(
                      iconUrl: logoURL,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                          : Text(schoolName!,
                              // 'P.S. 456',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w500,
                                fontSize: AppSize.size25.sp,
                                fontFamily: 'Inter',
                                fontStyle: FontStyle.normal,
                              )),
                      SizedBox(
                        height: 5.h,
                      ),
                      // Text('The Bronx Bears',
                      //     style: TextStyle(
                      //       color: AppColors.whiteColor,
                      //       fontWeight: FontWeight.w400,
                      //       fontSize: AppSize.size18.sp,
                      //       fontFamily: 'Inter',
                      //       fontStyle: FontStyle.normal,
                      //     )),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  titleTextWidget('SOLVED DASHBOARD+', context),
                  SizedBox(
                    height: 10.h,
                  ),
                  titleTextWidget(
                      pageTitle != null && pageTitle!.isNotEmpty
                          ? pageTitle!
                          : 'N/A',
                      context),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 75.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        //top: 13.sp, bottom: 13.sp,
                        left: 25.sp,
                        right: 25.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.blueColorBG,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        labelSmallWidget('Total Page Views', context),
                        // TextButton(
                        //     onPressed: () {
                        //       AppUtil.dialogBuilder(context);
                        //     },
                        //     child: labelSmallWidget('Total Page Views', context)),
                        SizedBox(
                          height: 10.h,
                        ),
                        labelMediumWidget(pageViewCount, context)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Container(
                    height: 75.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        //top: 13.sp, bottom: 13.sp,
                        left: 25.sp,
                        right: 25.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.whiteColor,
                    ),
                    child: Image.asset(
                      'assets/logo.png',
                      height: 40.h,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        menu(sectionList, model!),
      ],
    );
  }

  Widget menu(List<NavBarModel>? sectionList, ProjectHomeViewModel model) {
    return Container(
      margin: EdgeInsets.only(left: 190.sp, right: 190.sp, top: 36.sp),
      width: double.infinity,
      height: 74.h,
      decoration: const BoxDecoration(color: AppColors.whiteColor),
      child: AnimatedHoverMenu(
        receiveValue: (headerTitle, mainSection, subSection, selectedId) {
          model.menuTitleValue = headerTitle;
          model.tabTitleValue = mainSection;
          model.subTitleValue = subSection;
          if (model.menuTitleValue == null ||
              model.menuTitleValue!.isEmpty && subSection == '') {
            model.handleTabSelection(model.tabTitleValue, context!, selectedId);
          } else if (subSection == '') {
            model.handleSubMenuSelection(
                model.menuTitleValue!, model.tabTitleValue, context!);
          } else {
            model.handleSubSelection(model.menuTitleValue!, model.tabTitleValue,
                model.subTitleValue!, context!);
          }
        },
        // receiveValue: (menuName, tabTitle) {
        //   model.menuTitleValue = menuName;
        //   model.tabTitleValue = tabTitle;
        //   if (model.menuTitleValue == null || model.menuTitleValue!.isEmpty) {
        //     model.handleTabSelection(model.tabTitleValue, context!);
        //   } else {
        //     model.handleSubMenuSelection(
        //         model.menuTitleValue!, model.tabTitleValue, context!);
        //   }
        // },
        headerPosition: HeaderPosition.topLeft,
        headerTiles: sectionList!,
        headerBoxDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            color: Color(0xff996617)),
        headerTextColor: Colors.white,
        headerTextSize: 15.0,
        menuBoxDecoration: const BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: Color(0xff996617), width: 2),
          ),
        ),
        menuTextColor: const Color(0xff996617),
        animationType: AnimationType.springAcrossAxis,
        menuTextSize: 16.0,
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
