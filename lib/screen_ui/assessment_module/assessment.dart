import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/common_widget/three_column_text_and_image.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';

class Assessment extends StatefulWidget {
  @override
  _AssessmentState createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
          left: 190.sp, right: 190.sp, top: 36.sp, bottom: 80.sp),
      children: [
        pageTitleTextWidget('Latest Dashboard Features', context),
        SizedBox(
          height: 42.h,
        ),
      ],
    );
  }
}
//-----------------