import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/information_graph_card.dart';
import 'package:solved_dashboard/helper_widget/instructions_widget.dart';
import 'package:solved_dashboard/helper_widget/tabbar_item_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_util.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isHoveringFirst = false;
  bool _isHoveringSecond = false;
  bool _isHoveringThird = false;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
              onEnter: (_) => _mouseEnter(true, 1),
              onExit: (_) => _mouseEnter(false, 1),
              child: informationGraphCard(
                  'Grades & Report Cards',
                  'Dashboard Permissions',
                  '- Marking Period 1 & 2\n-ELA, MATH, Science, Social Studies\n-Available in ',
                  'Student Reports ',
                  '& ',
                  'Report Card ',
                  'assets/tabel.png',
                  _isHoveringFirst,
                  context),
            ),
            SizedBox(
              width: 42.w,
            ),
            MouseRegion(
              onEnter: (_) => _mouseEnter(true, 2),
              onExit: (_) => _mouseEnter(false, 2),
              child: informationGraphCard(
                  'Correlations',
                  '',
                  '-NYS Assessment Scores vs iReady/MAP Scores\n-Targeted Quadrants for Intervention\n-Available in ',
                  'Correlations Report',
                  '',
                  '',
                  'assets/graph.png',
                  _isHoveringSecond,
                  context),
            ),
            SizedBox(
              width: 42.w,
            ),
            MouseRegion(
              onEnter: (_) => _mouseEnter(true, 3),
              onExit: (_) => _mouseEnter(false, 3),
              child: informationGraphCard(
                  'Data Insights',
                  '',
                  '-Weekly Data Deep Dives directly to your email\n-Data-Driven Professional Development    Resources\n-Available in ',
                  'Data Insights',
                  '',
                  '',
                  'assets/data_inside.png',
                  _isHoveringThird,
                  context),
            ),
          ],
        ),
        SizedBox(
          height: 56.h,
        ),
        instructionsWidget(),
      ],
    );
  }

  void _mouseEnter(bool hovering, int value) {
    setState(() {
      if (value == 1) {
        _isHoveringFirst = hovering;
      } else if (value == 2) {
        _isHoveringSecond = hovering;
      } else if (value == 3) {
        _isHoveringThird = hovering;
      }
    });
  }
}
