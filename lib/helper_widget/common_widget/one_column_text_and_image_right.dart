import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/cache_networkimage.dart';

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
    return Padding(
      padding: EdgeInsets.only(
          left: 191.w,
          right: 191.w,
          bottom: 105.h,
          top: MediaQuery.of(context).size.height / 6),
      child: Card(
        elevation: 2,
        color: AppColors.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 52.w, top: 55.h),
              child: headerTextWidget(widget.titleText, context),
            ),
            // VerticalSpacerWidget(53.h),
            Padding(
              padding: EdgeInsets.only(
                left: 52.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 53.h),
                          child:
                              subHeaderTextWidget(widget.subTitleText, context),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 90.h, top: 30.h, right: 52.w),
                          child: detailTextWidget(
                              widget.detailDescription, context),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: 52.w),
                      child: CustomImage(
                        // height: 400,
                        // width: 300,
                        iconUrl: widget.imageUrl,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
