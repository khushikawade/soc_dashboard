import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:solved_dashboard/helper_widget/common_widget/three_column_text_and_image.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';

import '../../helper_widget/common_widget/iframe_custom_link_widget.dart';
import '../../helper_widget/common_widget/one_column_text_and_image_left.dart';
import '../../helper_widget/common_widget/one_column_text_and_image_right.dart';

import '../../helper_widget/common_widget/two_column_text_and_image.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
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
        ThreeColumnTextAndImageWidget(
          titleTextCard1: "",
          subTitleTextCard1: "Grades & Report Cards",
          detailDescriptionCard1: '''
  <div>
    <p>- Marking Period 1 <br>
    - ELA, MATH, Science, Social Studies<br>
    - Available in <a href="https://lookerstudio.google.com/u/0/reporting/75743c2d-5749-45e7-9562-58d0928662b2/page/m87aB">Student Reports</a> &amp; <a href="https://lookerstudio.google.com/u/0/reporting/75743c2d-5749-45e7-9562-58d0928662b2/page/p_9grki1pw2c">Report Card</a><br></p>
  </div>
''',
          imageUrlCard1: 'assets/tabel.png',
          subTitleTextCard2: "Correlations",
          detailDescriptionCard2: '''
  <div>
    <p>-NYS Assessment Scores vs iReady/MAP Scores<br>
    -Targeted Quadrants for Intervention<br>
    - Available in <a href="https://lookerstudio.google.com/u/0/reporting/75743c2d-5749-45e7-9562-58d0928662b2/page/p_8xqg8a182c">Correlations Report</a><br></p>
  </div>
''',
          imageUrlCard2: "assets/graph.png",
          subTitleTextCard3: "Data Insights",
          detailDescriptionCard3: '''
  <div>
    <p>-Weekly Data Deep Dives directly to your email <br>
    -Data-Driven Professional Development<br>&nbsp &nbsp Resources<br>
    - Available in <a href="https://lookerstudio.google.com/u/0/reporting/75743c2d-5749-45e7-9562-58d0928662b2/page/p_ef0a9fdm4c">Data Insights</a><br></p>
  </div>
''',
          imageUrlCard3: "assets/data_inside.png",
        ),
      ],
    );
  }
}
//-----------------