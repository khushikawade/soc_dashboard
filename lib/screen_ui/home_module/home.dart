import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/information_graph_card.dart';
import 'package:solved_dashboard/helper_widget/instructions_widget.dart';

import '../../helper_widget/common_widget/two_column_text_and_image.dart';

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
        const TwoColumnTextAndImageWidget(
          titleTextCard1: "Title Here",
          subTitleTextCard1: "There are Variations.",
          detailDescriptionCard1: '''<div>
    <p>
      - Marking Period 1 & 2 -ELA, MATH, Science, Social Studies <br>
      - Available in <a href="https://lookerstudio.google.com/u/0/reporting/75743c2d-5749-45e7-9562-58d0928662b2/page/m87aB">Student Reports</a> &amp; <a href="https://lookerstudio.google.com/u/0/reporting/75743c2d-5749-45e7-9562-58d0928662b2/page/p_9grki1pw2c">Report Card</a>
    
    </p>
  </div>
''',
          imageUrlCard1:
              "https://s3-alpha-sig.figma.com/img/d78c/cb1f/2bedc8d8bf4cfce811469c0e9d05c7f8?Expires=1691366400&Signature=et-U8SEdeh41abh31WGCOLuvCZZ42ZqDyZhNiRxt2NKS8MY3H9oi7fXhXER8DSJBHRqNKStRrlFpi-MQdRVtjhr4jxHxBRjwTtov6zT0UTRE8dwuDDvGkVsFJgYemxyEB1IGQTiwTwxc6kjxse~JZLIJhFaFadDaXXb8guSdexF7Y4pioOrezkcXEzGZJ6UT9aki-xEFe1u5uEJk6BEG5851AkO2tDYHAQimuf5zePiJhNhGxifQDTy3LQM7KmlzCoavAZ~dQ1sD7YimIg7Q1hi846Deg7oi0QZRER31cJtCHg6uY8YPpRRqDciQt7Ddw2q9nMrdKM5m1Rr1lyx-Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
          subTitleTextCard2: "Praesent lobor",
          detailDescriptionCard2: '''<div>
    <p>
      - Marking Period 1 & 2 -ELA, MATH, Science, Social Studies <br>
      - Available in <a href="https://lookerstudio.google.com/u/0/reporting/75743c2d-5749-45e7-9562-58d0928662b2/page/m87aB">Student Reports</a> &amp; <a href="https://lookerstudio.google.com/u/0/reporting/75743c2d-5749-45e7-9562-58d0928662b2/page/p_9grki1pw2c">Report Card</a>
    
    </p>
  </div>
''',
          imageUrlCard2:
              "https://s3-alpha-sig.figma.com/img/d78c/cb1f/2bedc8d8bf4cfce811469c0e9d05c7f8?Expires=1691366400&Signature=et-U8SEdeh41abh31WGCOLuvCZZ42ZqDyZhNiRxt2NKS8MY3H9oi7fXhXER8DSJBHRqNKStRrlFpi-MQdRVtjhr4jxHxBRjwTtov6zT0UTRE8dwuDDvGkVsFJgYemxyEB1IGQTiwTwxc6kjxse~JZLIJhFaFadDaXXb8guSdexF7Y4pioOrezkcXEzGZJ6UT9aki-xEFe1u5uEJk6BEG5851AkO2tDYHAQimuf5zePiJhNhGxifQDTy3LQM7KmlzCoavAZ~dQ1sD7YimIg7Q1hi846Deg7oi0QZRER31cJtCHg6uY8YPpRRqDciQt7Ddw2q9nMrdKM5m1Rr1lyx-Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
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
