import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class PushNotifcationCustomCard extends StatefulWidget {
  const PushNotifcationCustomCard({super.key});

  @override
  State<PushNotifcationCustomCard> createState() =>
      _PushNotifcationCustomCardState();
}

class _PushNotifcationCustomCardState extends State<PushNotifcationCustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      color: AppColors.backgroundBlueColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCardWidget(
              context, "assets/group_19036.png", "pushNotifyWidget", "")
        ],
      ),
    );
  }

  Widget _buildCardWidget(BuildContext context, String icon, String headerText,
      String subHeaderText) {
    return Padding(
      padding: EdgeInsets.only(left: 192.w),
      child: Container(
        height: 191.65.h,
        width: 358.96.w,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 31.w, top: 31.h, bottom: 30.h, right: 13.w),
                  child: Image.asset(
                    icon,
                    height: 130.h,
                    width: 130.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [pushNotifyWidget(headerText, context)],
            )
          ],
        ),
      ),
    );
  }
}
