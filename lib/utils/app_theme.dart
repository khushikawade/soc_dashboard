import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_size.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.appPrimaryColor,
      scaffoldBackgroundColor: AppColors.pageBGColor,
      textTheme: TextTheme(
          titleMedium: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: AppSize.size26.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          labelSmall: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: AppSize.size16.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          labelMedium: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: AppSize.size25.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          titleSmall: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w400,
            fontSize: AppSize.size14.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          titleLarge: TextStyle(
            color: AppColors.titleRedColor,
            fontWeight: FontWeight.w700,
            fontSize: AppSize.size35.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          displayMedium: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: AppSize.size30.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          displaySmall: TextStyle(
            color: AppColors.tabBarUnselctedText,
            fontWeight: FontWeight.w500,
            fontSize: AppSize.size16.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          bodySmall: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w400,
            fontSize: AppSize.size22,
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
          )));
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.blackColorBG,
      scaffoldBackgroundColor: AppColors.blackColorBG,
      textTheme: TextTheme(
          titleMedium: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: AppSize.size26.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          labelSmall: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: AppSize.size16.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          labelMedium: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: AppSize.size25.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          titleSmall: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w400,
            fontSize: AppSize.size14.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          titleLarge: TextStyle(
            color: AppColors.titleRedColor,
            fontWeight: FontWeight.w700,
            fontSize: AppSize.size35.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          displayMedium: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: AppSize.size30.sp,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          displaySmall: TextStyle(
            color: AppColors.tabBarUnselctedText,
            fontWeight: FontWeight.w500,
            fontSize: AppSize.size16,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          bodyMedium: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: AppSize.size40,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
          ),
          bodySmall: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w400,
            fontSize: AppSize.size22,
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
          )));

  ThemeData? _themeData;

  ThemeData? getTheme() => _themeData;
}

class SizeTheme {
  static const List<double> spacing = [
    0.0, //0
    2.0, //1
    4.0, //2
    6.0, //3
    8.0, //4
    10.0, //5
    12.0, //6
    14.0, //7
    16.0, //8
    18.0, //9
    20.0, //10
    22.0, //11
    24.0, //12
    26.0, //13
    28.0, //14
    30.0, //15
    32.0, //16
    34.0, //17
    36.0, //18
    38.0, //19
    40.0, //20
    42.0, //21
    44.0, //22
    46.0, //23
    48.0, //24
    50.0, //25
    52.0, //26
  ];
}

class IconSizeTheme {
  static const List<double> size = [
    0.0, //0
    2.0, //1
    4.0, //2
    6.0, //3
    8.0, //4
    10.0, //5
    12.0, //6
    16.0, //7
    20.0, //8
    24.0, //9
    28.0, //10
    32.0, //11
    36.0, //12
    40.0, //13
    44.0, //14
    48.0, //15
    52.0, //16
    85.0 //17
  ];
}
