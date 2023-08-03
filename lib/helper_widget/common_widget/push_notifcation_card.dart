import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class PushNotificationCustomCard extends StatefulWidget {
  final String icon1; //============for Icon in path==================
  final String icon2; //============for Icon in path==================
  final String icon3; //============for Icon in path==================
  final String icon4; //============for Icon in path==================

  final String?
      notificationText1; //============ noticationText of index 1==================
  final String?
      notificationText2; //============ noticationText of index 2==================
  final String?
      notificationText3; //============ noticationText of index 3==================
  final String?
      notificationText4; //============ noticationText of index 3==================
  final String?
      subNotificationText1; //============ subNotificationText of index 1==================
  final String?
      subNotificationText2; //============ subNotificationText of index 2==================
  final String?
      subNotificationText3; //============ subNotificationText of index 3==================
  final String?
      subNotificationText4; //============ subNotificationText of index 4==================
  PushNotificationCustomCard(
      {super.key,
      required this.icon1,
      required this.icon2,
      required this.icon3,
      required this.icon4,
      required this.notificationText1,
      required this.notificationText2,
      required this.notificationText3,
      required this.notificationText4,
      this.subNotificationText1,
      this.subNotificationText2,
      this.subNotificationText3,
      this.subNotificationText4});

  @override
  State<PushNotificationCustomCard> createState() =>
      _PushNotificationCustomCardState();
}

class _PushNotificationCustomCardState
    extends State<PushNotificationCustomCard> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Container(
        padding: EdgeInsets.only(top: 72.h, bottom: 71.w),
        color: AppColors.backgroundBlueColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCardWidget(context, widget.icon1, widget.notificationText1!,
                widget.subNotificationText1!),
            SizedBox(
              width: 34.5.w,
            ),
            _buildCardWidget(context, widget.icon2, widget.notificationText2!,
                widget.subNotificationText2!),
            SizedBox(
              width: 34.5.w,
            ),
            _buildCardWidget(context, widget.icon3, widget.notificationText4!,
                widget.subNotificationText3!),
            SizedBox(
              width: 34.5.w,
            ),
            _buildCardWidget(context, widget.icon4, widget.notificationText4!,
                widget.subNotificationText4!),
          ],
        ),
      ),
    );
  }

  Widget _buildCardWidget(BuildContext context, String icon,
      String noticationText, String subnoticationText) {
    return Container(
      width: 358.w,
      height: 192.h,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.06),
              blurRadius: 8.r,
              offset: const Offset(0, 8),
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 35.sp, right: 13.w, bottom: 30.h, top: 30.h),
              child: Image.asset(
                icon,
                height: 140.h,
                width: 140.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // SizedBox(
          //   width: 13.w,
          // ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pushNotifyWidget(noticationText, context),
                SizedBox(
                  height: 16.h,
                ),
                notificationNo(subnoticationText, context),
              ],
            ),
          )
        ],
      ),
    );
  }
}
