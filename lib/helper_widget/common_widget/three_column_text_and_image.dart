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

  ThreeColumnTextAndImageWidget(
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
  bool _isHoveringFirst = false;
  bool _isHoveringSecond = false;
  bool _isHoveringThird = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        cardWidget(
            context,
            widget.subTitleTextCard1,
            widget.detailDescriptionCard1,
            widget.imageUrlCard1,
            _isHoveringFirst,
            1),
        SizedBox(
          width: 20.w,
        ),
        cardWidget(
            context,
            widget.subTitleTextCard2,
            widget.detailDescriptionCard2,
            widget.imageUrlCard2,
            _isHoveringSecond,
            2),
        SizedBox(
          width: 20.w,
        ),
        cardWidget(
            context,
            widget.subTitleTextCard3,
            widget.detailDescriptionCard3,
            widget.imageUrlCard3,
            _isHoveringThird,
            3),
      ],
    );
  }

  Widget cardWidget(BuildContext context, String? subTitle, String? description,
      String? imageUrl, bool isHover, int index) {
    return Expanded(
      child: InkWell(
        onHover: (value) {
          isHover = true;
        },
        child: SelectionArea(
          child: MouseRegion(
            onEnter: (_) => _mouseEnter(true, index),
            onExit: (_) => _mouseEnter(false, index),
            child: Container(
              padding: EdgeInsets.only(left: 26.w, top: 39.h, right: 26.w),
              height: 627.h,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(0.r)),
                boxShadow: isHover
                    ? [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.1),
                          blurRadius: 20.0.r,
                          offset: const Offset(0, 20),
                          spreadRadius: 0,
                        ),
                      ]
                    : [],
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
                    height: 15.h,
                  ),
                  description != null && description.isNotEmpty
                      ? detailTextWidget(description, context)
                      : const SizedBox.shrink(),
                  SizedBox(
                    height: 28.h,
                  ),
                  imageUrl != null && imageUrl.isNotEmpty
                      ? CustomImage(
                          iconUrl: imageUrl,
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering, int value) {
    setState(() {
      if (value == 1) {
        _isHoveringFirst = hovering;
      } else if (value == 2) {
        _isHoveringSecond = hovering;
      } else if (value == 3) {
        _isHoveringThird = hovering;
      }
    });
  }
}
