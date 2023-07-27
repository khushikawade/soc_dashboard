import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/cache_networkimage.dart';

import 'package:solved_dashboard/helper_widget/heading_widget.dart';

import 'package:solved_dashboard/utils/app_colors.dart';

class ThreeColumnTextAndImageWidget extends StatefulWidget {
  final String?
      titleTextCard1; //============title text for Card1==================
  final String?
      subTitleTextCard1; //============subtitle text for Card1==================
  final String?
      detailDescriptionCard1; //============description text for Card1==================
  final String?
      imageUrlCard1; //============image path for Card1==================

  final String?
      subTitleTextCard2; //============subtitle text for Card2==================
  final String?
      detailDescriptionCard2; //============description text for Card2==================
  final String?
      imageUrlCard2; //============image path for Card2==================
  final String?
      subTitleTextCard3; //============subtitle text for Card3==================
  final String?
      detailDescriptionCard3; //============description text for Card3==================
  final String?
      imageUrlCard3; //============image path for Card3==================
  const ThreeColumnTextAndImageWidget(
      {super.key,
      required this.titleTextCard1,
      required this.subTitleTextCard1,
      required this.detailDescriptionCard1,
      required this.imageUrlCard1,
      this.subTitleTextCard2,
      this.detailDescriptionCard2,
      this.imageUrlCard2,
      this.subTitleTextCard3,
      this.detailDescriptionCard3,
      this.imageUrlCard3});

  @override
  State<ThreeColumnTextAndImageWidget> createState() =>
      _ThreeColumnTextAndImageWidgetState();
}

class _ThreeColumnTextAndImageWidgetState
    extends State<ThreeColumnTextAndImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
        SizedBox(
          width: 20.w,
        ),
        cardWidget(context, widget.subTitleTextCard3,
            widget.detailDescriptionCard3, widget.imageUrlCard3),
      ],
    );
  }

  Widget cardWidget(BuildContext context, String? subTitle, String? description,
      String? imageUrl) {
    return Expanded(
      child: Container(
        padding:
            EdgeInsets.only(left: 26.w, top: 39.h, bottom: 33.h, right: 26.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(
              0,
              0,
              0,
              0,
            ))
          ],
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subTitle != null && subTitle.isNotEmpty
                ? subHeaderTextWidget(subTitle, context)
                : const SizedBox.shrink(),
            SizedBox(
              height: 30.h,
            ),
            description != null && description.isNotEmpty
                ? detailTextWidget(description, context)
                : const SizedBox.shrink(),
            SizedBox(
              height: 28.h,
            ),
            imageUrl != null && imageUrl.isNotEmpty
                ? CustomImage(
                    // height: 400,
                    // width: 300,
                    iconUrl: imageUrl,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
