// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class FaqCustomPopup extends StatefulWidget {
  final String? headerTitle; //============title text==================
  final String?
      description1Text; //============ description of index 1==================
  final String?
      description2Text; //============description of index 2==================
  final String?
      description3Text; //============description of index 3==================
  final String? buttonText;
  const FaqCustomPopup(
      {super.key,
      this.headerTitle,
      this.description1Text,
      this.description2Text,
      this.description3Text,
      this.buttonText});

  @override
  State<FaqCustomPopup> createState() => _FaqCustomPopupState();
}

class _FaqCustomPopupState extends State<FaqCustomPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SelectionArea(
          child: Container(
            height: 871.h,
            width: 732.w,
            margin: EdgeInsets.symmetric(horizontal: 73.h, vertical: 84.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              // shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0.r,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.popUpAppBar,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r)),
                  ),
                  padding: EdgeInsets.only(
                      left: 90.w, bottom: 85.h, top: 64.h, right: 90.w),
                  child: labelTextForPopUpWidget(
                      widget.headerTitle ??
                          "There are many variations of passages",
                      context),
                ),
                SizedBox(
                  height: 65.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 73.w, right: 63.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      middleViewWidget(
                          context,
                          widget.description1Text ??
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut placerat libero. In sed lorem at turpis cursus imperdiet",
                          1),
                      SizedBox(
                        height: 46.h,
                      ),
                      middleViewWidget(
                          context,
                          widget.description2Text ??
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut placerat libero. In sed lorem at turpis cursus imperdiet",
                          2),
                      SizedBox(
                        height: 46.h,
                      ),
                      middleViewWidget(
                          context,
                          widget.description3Text ??
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut placerat libero. In sed lorem at turpis cursus imperdiet",
                          3),
                    ],
                  ),
                ),
                SizedBox(
                  height: 52.h,
                ),
                bottomButtonView(context, widget.buttonText)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget middleViewWidget(BuildContext context, text, index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 90.h,
          width: 90.w,
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(color: AppColors.borderColor, spreadRadius: 0.15)
              ]),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.circularContainer),
            child: Center(
                child: Padding(
              padding: EdgeInsets.all(2.w),
              child: labelTextIndex(index.toString(), context),
            )),
          ),
        ),
        SizedBox(
          width: 29.w,
        ),
        Expanded(
          child: threeColumnTextWidget(text, context),
        )
      ],
    );
  }

  Widget bottomButtonView(BuildContext context, String? text) {
    return Container(
      width: 74.w,
      margin: EdgeInsets.only(left: 84.w, right: 74.w, bottom: 81.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(color: AppColors.buttonCircularBorder, spreadRadius: 0.2)
          ]),
      child: Center(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
            child: buttonText(text ?? "Next", context),
          ),
        ],
      )),
    );
  }
}
