import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/cached_network_widget.dart';
import 'package:solved_dashboard/helper_widget/copy_right_widget.dart';
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
  String? schoolName;
  final String? pageTitle;
  final String? pageViewCount;
  final dynamic onclick;
  final Color? primaryColor;
  final bool? isBusy;
  final BuildContext? context;
  List<NavBarModel>? sectionList = [];
  ProjectHomeViewModel? model;

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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  splitDynamicText(schoolName ??
                                                          '')[1] ??
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
                    titleTextWidget(
                        pageTitle != null && pageTitle!.isNotEmpty
                            ? pageTitle!
                            : 'N/A',
                        context),
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
        ),
        // Container(
        //   padding: EdgeInsets.only(
        //       left: 192.sp, right: 192.sp, top: 11.sp, bottom: 11.sp),
        //   decoration: BoxDecoration(
        //     color: primaryColor ?? AppColors.appPrimaryColor,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     mainAxisSize: MainAxisSize.max,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         mainAxisSize: MainAxisSize.min,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           InkWell(
        //             onTap: () {
        //               AppUtil.dialogBuilder(context);
        //             },
        //             child: CustomIconMode(
        //               iconUrl: logoURL,
        //             ),
        //           ),
        //           SizedBox(
        //             width: 10.w,
        //           ),
        //           Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             mainAxisSize: MainAxisSize.min,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               isBusy!
        //                   ? ShimmerLoading(
        //                       isLoading: true,
        //                       child: Container(
        //                         height: 20.h,
        //                         width: 50.w,
        //                         color: Colors.white,
        //                       ),
        //                     )
        //                   : Text(schoolName!,
        //                       // 'P.S. 456',
        //                       style: TextStyle(
        //                         color: AppColors.whiteColor,
        //                         fontWeight: FontWeight.w500,
        //                         fontSize: AppSize.size25.sp,
        //                         fontFamily: 'Inter',
        //                         fontStyle: FontStyle.normal,
        //                       )),
        //               SizedBox(
        //                 height: 5.h,
        //               ),
        //               // Text('The Bronx Bears',
        //               //     style: TextStyle(
        //               //       color: AppColors.whiteColor,
        //               //       fontWeight: FontWeight.w400,
        //               //       fontSize: AppSize.size18.sp,
        //               //       fontFamily: 'Inter',
        //               //       fontStyle: FontStyle.normal,
        //               //     )),
        //             ],
        //           ),
        //         ],
        //       ),
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         mainAxisSize: MainAxisSize.min,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           titleTextWidget('SOLVED DASHBOARD+', context),
        //           SizedBox(
        //             height: 10.h,
        //           ),
        //           titleTextWidget(
        //               pageTitle != null && pageTitle!.isNotEmpty
        //                   ? pageTitle!
        //                   : 'N/A',
        //               context),
        //         ],
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         mainAxisSize: MainAxisSize.max,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Container(
        //             height: 75.h,
        //             alignment: Alignment.center,
        //             padding: EdgeInsets.only(
        //                 //top: 13.sp, bottom: 13.sp,
        //                 left: 25.sp,
        //                 right: 25.sp),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(5.r),
        //               color: AppColors.blueColorBG,
        //             ),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               mainAxisSize: MainAxisSize.min,
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 labelSmallWidget('Total Page Views', context),
        //                 // TextButton(
        //                 //     onPressed: () {
        //                 //       AppUtil.dialogBuilder(context);
        //                 //     },
        //                 //     child: labelSmallWidget('Total Page Views', context)),
        //                 SizedBox(
        //                   height: 10.h,
        //                 ),
        //                 labelMediumWidget(pageViewCount, context)
        //               ],
        //             ),
        //           ),
        //           SizedBox(
        //             width: 10.sp,
        //           ),
        //           Container(
        //             height: 75.h,
        //             alignment: Alignment.center,
        //             padding: EdgeInsets.only(
        //                 //top: 13.sp, bottom: 13.sp,
        //                 left: 25.sp,
        //                 right: 25.sp),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(5.r),
        //               color: AppColors.whiteColor,
        //             ),
        //             child: Image.asset(
        //               'assets/logo.png',
        //               height: 40.h,
        //             ),
        //           )
        //         ],
        //       )
        //     ],
        //   ),
        // ),

        menu(sectionList, model!),

        // copyRightWidget('© 2023 Bronx Bears. All Rights Reserved.', context,
        //     model!.getColorFromHex(model!.primaryColorC)),
      ],
    );
    // return Container(
    //   padding: EdgeInsets.only(
    //       left: 192.sp, right: 192.sp, top: 11.sp, bottom: 11.sp),
    //   decoration: BoxDecoration(
    //     color: primaryColor ?? AppColors.appPrimaryColor,
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Row(
    //         children: [
    //           InkWell(
    //             onTap: () {
    //               AppUtil.dialogBuilder(context);
    //             },
    //             child: CustomIconMode(
    //               iconUrl: logoURL,
    //             ),
    //           ),
    //           SizedBox(width: 10.w),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               isBusy!
    //                   ? ShimmerLoading(
    //                       isLoading: true,
    //                       child: Container(
    //                         height: 20.h,
    //                         width: 50.w,
    //                         color: Colors.white,
    //                       ),
    //                     )
    //                   : FittedBox(
    //                       fit: BoxFit.scaleDown,
    //                       child: Container(
    //                         height: 57.h,
    //                         width: 195.w, // Take the available width
    //                         child: SelectionArea(
    //                           child: Align(
    //                             alignment: Alignment.centerRight,
    //                             child: Column(
    //                               mainAxisSize: MainAxisSize.min,
    //                               mainAxisAlignment: MainAxisAlignment.center,
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 splitDynamicText(schoolName ?? '')
    //                                         .isNotEmpty
    //                                     ? Text(
    //                                         splitDynamicText(
    //                                                 schoolName ?? '')[0] ??
    //                                             '',
    //                                         softWrap: true,
    //                                         maxLines: 2,
    //                                         textAlign: TextAlign.center,
    //                                         style: TextStyle(
    //                                           color: AppColors.whiteColor,
    //                                           fontWeight: FontWeight.w500,
    //                                           fontSize: AppSize.size22.sp,
    //                                           fontFamily: 'Inter',
    //                                           fontStyle: FontStyle.normal,
    //                                         ),
    //                                       )
    //                                     : const SizedBox.shrink(),
    //                                 splitDynamicText(schoolName ?? '')
    //                                         .isNotEmpty
    //                                     ? Flexible(
    //                                         fit: FlexFit.loose,
    //                                         child: Text(
    //                                           splitDynamicText(
    //                                                   schoolName ?? '')[1] ??
    //                                               '',
    //                                           softWrap: true,
    //                                           maxLines: 2,
    //                                           textAlign: TextAlign.left,
    //                                           style: TextStyle(
    //                                             color: AppColors.whiteColor,
    //                                             fontWeight: FontWeight.w500,
    //                                             fontSize: AppSize.size18.sp,
    //                                             fontFamily: 'Inter',
    //                                             fontStyle: FontStyle.normal,
    //                                           ),
    //                                         ),
    //                                       )
    //                                     : const SizedBox.shrink()
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     )

    //               //     fit: BoxFit.scaleDown,
    //               //     child: SizedBox(
    //               //       width: 191.w,
    //               //       // color: Colors.pink,

    //               //       child: Align(
    //               //         alignment: Alignment.center,
    //               //         child: Text(
    //               //           schoolName!,
    //               //           softWrap: false,
    //               //           //maxLines: 2,
    //               //           textAlign: TextAlign.center,
    //               //           style: TextStyle(
    //               //             color: AppColors.whiteColor,
    //               //             fontWeight: FontWeight.w500,
    //               //             fontSize: AppSize.size25.sp,
    //               //             fontFamily: 'Inter',
    //               //             fontStyle: FontStyle.normal,
    //               //           ),
    //               //         ),
    //               //       ),
    //               //     ),
    //               //   ),

    //               ,
    //               SizedBox(height: 5.h),
    //             ],
    //           ),
    //         ],
    //       ),
    //       Expanded(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             titleTextWidget('SOLVED DASHBOARD+', context),
    //             SizedBox(height: 10.h),
    //             titleTextWidget('Home', context),
    //           ],
    //         ),
    //       ),
    //       Row(
    //         children: [
    //           Container(
    //             padding: EdgeInsets.only(left: 25.sp, right: 25.sp),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(5.r),
    //               color: AppColors.blueColorBG,
    //             ),
    //             child: Column(
    //               children: [
    //                 Padding(
    //                   padding: EdgeInsets.only(
    //                     top: 10.h,
    //                   ),
    //                   child: labelSmallWidget('Total Page Views', context),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.only(bottom: 9.h),
    //                   child: labelMediumWidget(pageViewCount, context),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           SizedBox(width: 10.sp),
    //           Container(
    //             padding: EdgeInsets.only(
    //                 left: 25.sp, right: 25.sp, top: 7.h, bottom: 8.h),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(5.r),
    //               color: AppColors.whiteColor,
    //             ),
    //             child: Padding(
    //               padding: EdgeInsets.only(top: 7.h, bottom: 8.h),
    //               child: Image.asset(
    //                 'assets/logo.png',
    //                 height: 40.h,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget menu(List<NavBarModel>? sectionList, ProjectHomeViewModel model) {
    return Container(
      margin: EdgeInsets.only(left: 190.sp, right: 190.sp, top: 36.sp),
      width: double.infinity,
      height: 74.h,
      decoration: const BoxDecoration(color: AppColors.whiteColor),
      child: AnimatedHoverMenu(
        receiveValue: (menuName, tabTitle) {
          model.menuTitleValue = menuName;
          model.tabTitleValue = tabTitle;
          if (model.menuTitleValue == null || model.menuTitleValue!.isEmpty) {
            model.handleTabSelection(model.tabTitleValue, context!);
          } else {
            model.handleSubMenuSelection(
                model.menuTitleValue!, model.tabTitleValue, context!);
          }
        },
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

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:solved_dashboard/helper_widget/cached_network_widget.dart';
// import 'package:solved_dashboard/helper_widget/heading_widget.dart';
// import 'package:solved_dashboard/utils/app_colors.dart';
// import 'package:solved_dashboard/utils/app_size.dart';
// import 'package:solved_dashboard/utils/app_util.dart';
// import 'package:solved_dashboard/utils/overrides.dart';
// import 'package:vrouter/vrouter.dart';

// class AppBarWidget extends StatelessWidget {
//   final String? logoURL;
//   final String? schoolName;
//   final String? pageTitle;
//   final String? pageViewCount;
//   final dynamic onclick;
//   final Color? primaryColor;
//   final BuildContext? context;

//   const AppBarWidget(
//       {this.logoURL,
//       this.schoolName,
//       this.pageTitle,
//       this.pageViewCount,
//       this.onclick,
//       this.primaryColor,
//       this.context});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//           left: 192.sp, right: 192.sp, top: 11.sp, bottom: 11.sp),
//       decoration: BoxDecoration(
//         color: primaryColor ?? AppColors.appPrimaryColor,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       AppUtil.dialogBuilder(context);
//                     },
//                     child: CustomIconMode(
//                       iconUrl: logoURL,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.w,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('P.S. 456',
//                           style: TextStyle(
//                             color: AppColors.whiteColor,
//                             fontWeight: FontWeight.w500,
//                             fontSize: AppSize.size25.sp,
//                             fontFamily: 'Inter',
//                             fontStyle: FontStyle.normal,
//                           )),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Text('The Bronx Bears',
//                           style: TextStyle(
//                             color: AppColors.whiteColor,
//                             fontWeight: FontWeight.w400,
//                             fontSize: AppSize.size18.sp,
//                             fontFamily: 'Inter',
//                             fontStyle: FontStyle.normal,
//                           )),
//                     ],
//                   ),
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   titleTextWidget('SOLVED DASHBOARD+', context),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   titleTextWidget('Home', context),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 75.h,
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.only(
//                         //top: 13.sp, bottom: 13.sp,
//                         left: 25.sp,
//                         right: 25.sp),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5.r),
//                       color: AppColors.blueColorBG,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         labelSmallWidget('Total Page Views', context),
//                         // TextButton(
//                         //     onPressed: () {
//                         //       AppUtil.dialogBuilder(context);
//                         //     },
//                         //     child: labelSmallWidget('Total Page Views', context)),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         labelMediumWidget(pageViewCount, context)
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10.sp,
//                   ),
//                   Container(
//                     height: 75.h,
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.only(
//                         //top: 13.sp, bottom: 13.sp,
//                         left: 25.sp,
//                         right: 25.sp),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5.r),
//                       color: AppColors.whiteColor,
//                     ),
//                     child: Image.asset(
//                       'assets/logo.png',
//                       height: 40.h,
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//           SizedBox(
//             height: 16.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _buildNavigationItems('Home'),
//               _buildNavigationItems('Reports'),
//               _buildNavigationItems('Assessment'),
//               _buildNavigationItems('Data Insides'),
//               _buildNavigationItems('Apps+'),
//               _buildNavigationItems('Engagement'),
//               _buildNavigationItems('+ Data'),
//               _buildNavigationItems('Support'),
//             ],
//           ),
//         ],
//       ),
//     );
//     // AppBar(
//     //     automaticallyImplyLeading: false,
//     //     elevation: 0,
//     //     backgroundColor: AppColors.appPrimaryColor,
//     //     title: Container(
//     //       width: 39.w,
//     //       height: 39.h,
//     //       decoration: BoxDecoration(
//     //         border: Border.all(color: AppColors.fieldBorderColor),
//     //         borderRadius: BorderRadius.circular(10.r),
//     //       ),
//     //       child: InkWell(
//     //           onTap: () {
//     //             onclick ? exit(0) : Navigator.pop(context);
//     //           },
//     //           child: Icon(
//     //             MicroMitti.chevron_left,
//     //             color: AppColors.black,
//     //             size: 15.sp,
//     //           )),
//     //     ),
//     //     actions: [
//     //       appBarTitle != ''
//     //           ? Row(
//     //               mainAxisAlignment: MainAxisAlignment.start,
//     //               mainAxisSize: MainAxisSize.min,
//     //               crossAxisAlignment: CrossAxisAlignment.center,
//     //               children: [
//     //                   Text(
//     //                     appBarTitle!,
//     //                     style: TextStyle(
//     //                         fontSize: AppSize.size14,
//     //                         color: AppColors.lightGrey,
//     //                         fontWeight: FontWeight.w400,
//     //                         fontFamily: 'Inter'),
//     //                   ),
//     //                   InkWell(
//     //                     onTap: () {
//     //                       if (appBarAdditionalText == " Sign Up") {
//     //                         Navigator.pushNamed(
//     //                             AppUtil.getContext(), '/register_screen');
//     //                       } else if (appBarAdditionalText == " Log In") {
//     //                         Navigator.pushNamed(
//     //                             AppUtil.getContext(), '/login_screen');
//     //                       }
//     //                     },
//     //                     child: Text(
//     //                       appBarAdditionalText,
//     //                       style: TextStyle(
//     //                           color: AppColors.yellow,
//     //                           fontSize: AppSize.size14,
//     //                           fontWeight: FontWeight.w400,
//     //                           fontFamily: 'Inter'),
//     //                     ),
//     //                   ),
//     //                   SizedBox(
//     //                     width: 16.sp,
//     //                   )
//     //                 ])
//     //           : Container()
//     //     ]);
//   }

//   Widget _buildNavigationItems(String title) {
//     return GestureDetector(
//       onTap: () => _handleTabSelection(title),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showPopupMenuReport(String menuTitle) async {
//     await showMenu(
//       context: context!,
//       position: const RelativeRect.fromLTRB(100, 100, 100, 100),
//       items: [
//         PopupMenuItem<String>(
//           value: 'Student Report',
//           child: const Text('Student Report'),
//           onTap: () {
//             _handleSubMenuSelection('Student Report', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'Class Report',
//           child: const Text('Class Report'),
//           onTap: () {
//             _handleSubMenuSelection('Class Report', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'Report Card',
//           child: const Text('Report Card'),
//           onTap: () {
//             _handleSubMenuSelection('Report Card', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'School Report',
//           child: const Text('School Report'),
//           onTap: () {
//             _handleSubMenuSelection('School Report', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'Correlations',
//           child: const Text('Correlations'),
//           onTap: () {
//             _handleSubMenuSelection('Correlations', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'Dashboard Usage',
//           child: const Text('Dashboard Usage'),
//           onTap: () {
//             _handleSubMenuSelection('Dashboard Usage', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'Dashboard Permissions',
//           child: const Text('Dashboard Permissions'),
//           onTap: () {
//             _handleSubMenuSelection('Dashboard Permissions', menuTitle);
//           },
//         ),
//       ],
//       elevation: 8.0,
//     );
//   }

//   void _showPopupMenuAssessment(String menuTitle) async {
//     await showMenu(
//       context: context!,
//       position: const RelativeRect.fromLTRB(100, 100, 100, 100),
//       items: [
//         PopupMenuItem<String>(
//           value: 'MAP',
//           child: const Text('MAP'),
//           onTap: () {
//             _handleSubMenuSelection('MAP', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'iReady',
//           child: const Text('iReady'),
//           onTap: () {
//             _handleSubMenuSelection('iReady', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'Acadience',
//           child: const Text('Acadience'),
//           onTap: () {
//             _handleSubMenuSelection('Acadience', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'NYS/ISA',
//           child: const Text('NYS/ISA'),
//           onTap: () {
//             _handleSubMenuSelection('NYS/ISA', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'F&P',
//           child: const Text('F&P'),
//           onTap: () {
//             _handleSubMenuSelection('F&P', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'DRP',
//           child: const Text('DRP'),
//           onTap: () {
//             _handleSubMenuSelection('DRP', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'June Instructional Report',
//           child: const Text('June Instructional Report'),
//           onTap: () {
//             _handleSubMenuSelection('June Instructional Report', menuTitle);
//           },
//         ),
//         PopupMenuItem<String>(
//           value: 'SEL',
//           child: const Text('SEL'),
//           onTap: () {
//             _handleSubMenuSelection('SEL', menuTitle);
//           },
//         ),
//       ],
//       elevation: 8.0,
//     );
//   }

//   void _handleTabSelection(String title) {
//     final to = context!.vRouter.to;

//     if (title == "Reports") {
//       _showPopupMenuReport("Reports");
//     } else if (title == "Assessment") {
//       _showPopupMenuAssessment("Assessment");
//     } else {
//       switch (title) {
//         case 'Home':
//           return to(Overrides.SCHOOL_ID.isNotEmpty
//               ? '/${Overrides.SCHOOL_ID}/Home'
//               : '/Home');
//         case 'Reports':
//           return to(Overrides.SCHOOL_ID.isNotEmpty
//               ? '/${Overrides.SCHOOL_ID}/Reports'
//               : '/Reports');
//         case 'Assessment':
//           return to(Overrides.SCHOOL_ID.isNotEmpty
//               ? '/${Overrides.SCHOOL_ID}/Assessment'
//               : '/Assessment');
//         case 'Data Insides':
//           return to(Overrides.SCHOOL_ID.isNotEmpty
//               ? '/${Overrides.SCHOOL_ID}/Data_Insides'
//               : '/Data_Insides');
//         case 'Apps+':
//           return to(Overrides.SCHOOL_ID.isNotEmpty
//               ? '/${Overrides.SCHOOL_ID}/Apps'
//               : '/Apps');
//         case 'Engagement':
//           return to(Overrides.SCHOOL_ID.isNotEmpty
//               ? '/${Overrides.SCHOOL_ID}/Engagement'
//               : '/Engagement');
//         case '+ Data':
//           return to(Overrides.SCHOOL_ID.isNotEmpty
//               ? '/${Overrides.SCHOOL_ID}/Data'
//               : '/Data');
//         case 'Support':
//           return to(Overrides.SCHOOL_ID.isNotEmpty
//               ? '/${Overrides.SCHOOL_ID}/Support'
//               : '/Support');
//       }
//     }
//   }

//   void _handleSubMenuSelection(String subMenu, String menuTitle) {
//     final to = context!.vRouter.to;
//     Overrides.SUB_MENU = subMenu.replaceAll(" ", "_");

//     if (menuTitle == "Reports") {
//       to(Overrides.SCHOOL_ID.isNotEmpty
//           ? '/${Overrides.SCHOOL_ID}/Reports/${Overrides.SUB_MENU}'
//           : '/Reports');
//     } else if (menuTitle == "Assessment") {
//       to(Overrides.SCHOOL_ID.isNotEmpty
//           ? '/${Overrides.SCHOOL_ID}/Assessment/${Overrides.SUB_MENU}'
//           : '/Assessment');
//     }
//   }
// }
