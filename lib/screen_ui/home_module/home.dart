import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/information_graph_card.dart';
import 'package:solved_dashboard/helper_widget/instructions_widget.dart';
import 'package:solved_dashboard/utils/app_util.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(Object context) {
    return Container(
      // width: double.infinity,
      // height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            left: 190.sp, right: 190.sp, top: 36.sp, bottom: 80.sp),
        children: [
          pageTitleTextWidget(
              'Latest Dashboard Features', AppUtil.getContext()),
          SizedBox(
            height: 42.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              informationGraphCard(
                  'Grades & Report Cards',
                  'Dashboard Permissions',
                  '- Marking Period 1 & 2\n-ELA, MATH, Science, Social Studies\n-Available in ',
                  'Student Reports ',
                  '& ',
                  'Report Card ',
                  'assets/tabel.png'),
              SizedBox(
                width: 42.w,
              ),
              informationGraphCard(
                  'Correlations',
                  '',
                  '-NYS Assessment Scores vs iReady/MAP Scores\n-Targeted Quadrants for Intervention\n-Available in ',
                  'Correlations Report',
                  '',
                  '',
                  'assets/graph.png'),
              SizedBox(
                width: 42.w,
              ),
              informationGraphCard(
                  'Data Insights',
                  '',
                  '-Weekly Data Deep Dives directly to your email\n-Data-Driven Professional Development    Resources\n-Available in ',
                  'Data Insights',
                  '',
                  '',
                  'assets/data_inside.png'),
            ],
          ),
          SizedBox(
            height: 56.h,
          ),
          instructionsWidget(),
        ],
      ),
    );
  }
}
