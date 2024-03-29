import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class OneColumnTextAndImageRightWidget extends StatefulWidget {
  final String? titleText; //============title text==================
  final String? subTitleText; //============subtitle text==================
  final String?
      detailDescription; //============description text==================
  final String? imageUrl; //============image path==================
  const OneColumnTextAndImageRightWidget(
      {super.key,
      required this.titleText,
      required this.subTitleText,
      required this.detailDescription,
      required this.imageUrl});

  @override
  State<OneColumnTextAndImageRightWidget> createState() =>
      _OneColumnTextAndImageRightWidgetState();
}

class _OneColumnTextAndImageRightWidgetState
    extends State<OneColumnTextAndImageRightWidget> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Container(
        // padding: EdgeInsets.only(
        //   left: 40.w,
        //   bottom: 90.h,
        // ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.03),
              blurRadius: 7.0.r,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.titleText != ""
                ? Container(
                    margin: EdgeInsets.only(
                      left: 121.w,
                      top: 55.h,
                      bottom: 90.h,
                    ),
                    child: headerTextWidget(widget.titleText, context))
                : const SizedBox.shrink(),
            // VerticalSpacerWidget(53.h),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 121.w,
                    top: 55.h,
                    bottom: 90.h,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.subTitleText != ""
                            ? subHeaderTextWidget(widget.subTitleText, context)
                            : const SizedBox.shrink(),
                        widget.subTitleText != ""
                            ? SizedBox(
                                height: 30.h,
                              )
                            : const SizedBox.shrink(),
                        detailTextWidget(widget.detailDescription, context),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    widget.imageUrl!,
                    width: 800.w,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
