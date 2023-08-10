import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class Apps extends StatefulWidget {
  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> {
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
            child: pageTitleTextWidget('Apps', context),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
