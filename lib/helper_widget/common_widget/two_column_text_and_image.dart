import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/cache_networkimage.dart';

import 'package:solved_dashboard/helper_widget/heading_widget.dart';

import 'package:solved_dashboard/utils/app_colors.dart';

class TwoColumnTextAndImageWidget extends StatefulWidget {
  final String?
      titleTextCard1; //============title text for Card1==================
  final String?
      subTitleTextCard1; //============subtitle text for Card1==================
  final String?
      detailDescriptionCard1; //============description text for Card1==================
  final String?
      imageUrlCard1; //============image path for Card1==================
  final String?
      titleTextCard2; //============title text for Card2==================
  final String?
      subTitleTextCard2; //============subtitle text for Card2==================
  final String?
      detailDescriptionCard2; //============description text for Card2==================
  final String?
      imageUrlCard2; //============image path for Card2==================
  const TwoColumnTextAndImageWidget(
      {super.key,
      required this.titleTextCard1,
      required this.subTitleTextCard1,
      required this.detailDescriptionCard1,
      required this.imageUrlCard1,
      this.titleTextCard2,
      this.subTitleTextCard2,
      this.detailDescriptionCard2,
      this.imageUrlCard2});

  @override
  State<TwoColumnTextAndImageWidget> createState() =>
      _TwoColumnTextAndImageWidgetState();
}

class _TwoColumnTextAndImageWidgetState
    extends State<TwoColumnTextAndImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 191.w, right: 191.w, bottom: 105.h, top: 203.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          cardWidget(context, widget.subTitleTextCard1,
              widget.detailDescriptionCard1, widget.imageUrlCard1),
          SizedBox(
            width: 20.w,
          ),
          cardWidget(context, widget.subTitleTextCard2,
              widget.detailDescriptionCard2, widget.imageUrlCard2),
        ],
      ),
    );
  }

  Widget cardWidget(BuildContext context, String? subTitle, String? description,
      String? imageUrl) {
    return Expanded(
      child: Card(
        elevation: 2,
        color: AppColors.whiteColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 35.h, left: 41.w),
              child: subTitle != null && subTitle.isNotEmpty
                  ? subHeaderTextWidget(subTitle, context)
                  : const SizedBox.shrink(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 28.h, left: 41.w, right: 71.w),
              child: description != null && description.isNotEmpty
                  ? detailTextWidget(description, context)
                  : const SizedBox.shrink(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 28.h, left: 41.w, right: 41.w, bottom: 40.h),
              child: imageUrl != null && imageUrl.isNotEmpty
                  ? CustomImage(
                      // height: 400,
                      // width: 300,
                      iconUrl: imageUrl,
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
