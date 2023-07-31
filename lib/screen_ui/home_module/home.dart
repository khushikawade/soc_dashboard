import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/common_widget.dart/three_column_text_and_image.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/information_graph_card.dart';
import 'package:solved_dashboard/utils/app_util.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(Object context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 190.sp, right: 190.sp, top: 36.sp),
        children: [
          pageTitleTextWidget(
              'Latest Dashboard Features', AppUtil.getContext()),
          SizedBox(
            height: 42.h,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.max,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     informationGraphCard(
          //         'Grades & Report Cards', '', 'assets/tabel.png')
          //   ],
          // )
       
       
        ],
      ),
    );
  }
}
