import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(Object context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        // padding: EdgeInsets.only(
        //     left: 190.sp, right: 190.sp, top: 36.sp, bottom: 80.sp),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 190.sp, right: 190.sp, top: 40.sp),
            child: pageTitleTextWidget('Data+', context),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
