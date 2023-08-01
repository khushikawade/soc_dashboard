import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/cached_network_widget.dart';
import 'package:solved_dashboard/helper_widget/common_widget/faq_custom_popup.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/shimmer_loading.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_size.dart';

class AppBarWidget extends StatelessWidget {
  final String? logoURL;
  final String? schoolName;
  final String? pageTitle;
  final String? pageViewCount;
  final dynamic onclick;
  final Color? primaryColor;
  final bool? isBusy;

  const AppBarWidget(
      {this.logoURL,
      this.schoolName,
      this.pageTitle,
      this.pageViewCount,
      this.onclick,
      this.primaryColor,
      this.isBusy});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              CustomIconMode(
                iconUrl: logoURL,
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
              titleTextWidget('Home', context),
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
    );
    // AppBar(
    //     automaticallyImplyLeading: false,
    //     elevation: 0,
    //     backgroundColor: AppColors.appPrimaryColor,
    //     title: Container(
    //       width: 39.w,
    //       height: 39.h,
    //       decoration: BoxDecoration(
    //         border: Border.all(color: AppColors.fieldBorderColor),
    //         borderRadius: BorderRadius.circular(10.r),
    //       ),
    //       child: InkWell(
    //           onTap: () {
    //             onclick ? exit(0) : Navigator.pop(context);
    //           },
    //           child: Icon(
    //             MicroMitti.chevron_left,
    //             color: AppColors.black,
    //             size: 15.sp,
    //           )),
    //     ),
    //     actions: [
    //       appBarTitle != ''
    //           ? Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               mainAxisSize: MainAxisSize.min,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                   Text(
    //                     appBarTitle!,
    //                     style: TextStyle(
    //                         fontSize: AppSize.size14,
    //                         color: AppColors.lightGrey,
    //                         fontWeight: FontWeight.w400,
    //                         fontFamily: 'Inter'),
    //                   ),
    //                   InkWell(
    //                     onTap: () {
    //                       if (appBarAdditionalText == " Sign Up") {
    //                         Navigator.pushNamed(
    //                             AppUtil.getContext(), '/register_screen');
    //                       } else if (appBarAdditionalText == " Log In") {
    //                         Navigator.pushNamed(
    //                             AppUtil.getContext(), '/login_screen');
    //                       }
    //                     },
    //                     child: Text(
    //                       appBarAdditionalText,
    //                       style: TextStyle(
    //                           color: AppColors.yellow,
    //                           fontSize: AppSize.size14,
    //                           fontWeight: FontWeight.w400,
    //                           fontFamily: 'Inter'),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     width: 16.sp,
    //                   )
    //                 ])
    //           : Container()
    //     ]);
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
