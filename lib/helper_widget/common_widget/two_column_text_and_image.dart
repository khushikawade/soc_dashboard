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
  const TwoColumnTextAndImageWidget(
      {super.key,
      required this.titleTextCard1,
      required this.subTitleTextCard1,
      required this.detailDescriptionCard1,
      required this.imageUrlCard1});

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
      child: Card(
        elevation: 2,
        color: AppColors.whiteColor,
        child: Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 53.h),
                child: subHeaderTextWidget(widget.subTitleTextCard1, context),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 30.h,
                ),
                child: detailTextWidget(widget.detailDescriptionCard1, context),
              ),
              CustomImage(
                // height: 400,
                // width: 300,
                iconUrl: widget.imageUrlCard1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
