import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

Widget tabBarItemWidget(
    String tabName, bool isSelected, iconName, BuildContext context,
    {dropDownIcon}) {
  return Container(
    height: 74.h,
    //padding: EdgeInsets.only(top: 30.sp, bottom: 30.sp),
    alignment: Alignment.center,
    decoration: isSelected
        ? const BoxDecoration(color: AppColors.tabBarSelectedBG)
        : null,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconName,
          color:
              isSelected ? AppColors.whiteColor : AppColors.tabBarUnselctedText,
          size: 16.sp,
        ),
        SizedBox(
          width: 16.w,
        ),
        tabBarItemWidgetText(tabName, context,
            isSelected ? AppColors.whiteColor : AppColors.tabBarUnselctedText),
        SizedBox(
          width: 12.w,
        ),
        Icon(
          dropDownIcon,
          color: AppColors.black,
          size: 20.sp,
        ),
      ],
    ),
  );
}
