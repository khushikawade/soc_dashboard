import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

Widget richTextWidget(String simpleText1, String simpleText2, String richText1,
    String richText2) {
  return RichText(
    text: TextSpan(
      text: simpleText1,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 18.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      ),
      children: <TextSpan>[
        TextSpan(
            text: richText1,
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: 'Roboto',
              fontSize: 18.sp,
              color: AppColors.linkTextColor,
              fontWeight: FontWeight.w400,
            )),
        simpleText2 != null && simpleText2.isNotEmpty
            ? TextSpan(
                text: '& ',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ))
            : const TextSpan(),
        richText2 != null && richText2.isNotEmpty
            ? TextSpan(
                text: richText2,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontFamily: 'Roboto',
                  fontSize: 18.sp,
                  color: AppColors.linkTextColor,
                  fontWeight: FontWeight.w400,
                ))
            : const TextSpan(),
      ],
    ),
  );
}
