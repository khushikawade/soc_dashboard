import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/cache_networkimage.dart';

import 'package:solved_dashboard/helper_widget/heading_widget.dart';

import 'package:solved_dashboard/utils/app_colors.dart';

class OneColumnTextAndImageLeftWidget extends StatefulWidget {
  final String? titleText; //============title text==================
  final String? subTitleText; //============subtitle text==================
  final String?
      detailDescription; //============description text==================
  final String? imageUrl; //============image path==================
  const OneColumnTextAndImageLeftWidget(
      {super.key,
      required this.titleText,
      required this.subTitleText,
      required this.detailDescription,
      required this.imageUrl});

  @override
  State<OneColumnTextAndImageLeftWidget> createState() =>
      _OneColumnTextAndImageLeftWidgetState();
}

class _OneColumnTextAndImageLeftWidgetState
    extends State<OneColumnTextAndImageLeftWidget> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Container(
        padding:
            EdgeInsets.only(left: 40.w, top: 55.h, bottom: 90.h, right: 55.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 20.0.r,
              offset: const Offset(0, 20),
              spreadRadius: 0,
            ),
          ],
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerTextWidget(widget.titleText, context),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(right: 52.w, top: 53.h),
                    child: CustomImage(
                      // height: 400,
                      // width: 300,
                      iconUrl: widget.imageUrl,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      subHeaderTextWidget(widget.subTitleText, context),
                      SizedBox(
                        height: 30.h,
                      ),
                      detailTextWidget(widget.detailDescription, context),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
