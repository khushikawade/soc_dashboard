import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/helper_widget/common_widget/three_column_text_and_image.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';

import '../../helper_widget/common_widget/one_column_text_and_image_right.dart';

import '../../helper_widget/common_widget/two_column_text_and_image.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isHoveringFirst = false;
  bool _isHoveringSecond = false;
  bool _isHoveringThird = false;

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
//         const OneColumnTextAndImageRightWidget(
//           titleText: "Title Here",
//           subTitleText: "Praesent lobortis metus ex.",
//           detailDescription: '''
//   <div>
//     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut placerat libero.
//      In sed lorem at turpis cursus imperdiet nec at dui. Aenean tortor mauris,
//      consequat non imperdiet vel, tristique nec urna. Mauris et imperd
//      iet ligula, imperdiet lacinia leo. Curabitur dictum veli<br><br>varius, viverra
//      Etiam hendrerit dui vel enim dignissim tempus. Pellentesque hendrerit enim sodales, commodo sapien sed, hendrerit mi. Integer facilisis mauris a nunc euismod, id fermentum</p>
//    <br><br>varius, viverra
//      Etiam hendrerit dui vel enim dignissim tempus. Pellentesque hendrerit enim sodales, commodo sapien sed, hendrerit mi. Integer facilisis mauris a nunc euismod, id fermentum</p>

//   </div>
// ''',
//           imageUrl: "assets/one_column_image.png",
//         ),
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

        SizedBox(
          height: 56.h,
        ),
        const OneColumnTextAndImageRightWidget(
          titleText: "",
          subTitleText: "",
          detailDescription: '''
  <div>
    <p>Your school’s dashboard was developed to <br>make students’ data more accessible, inform<br>classroom instruction, and empower educators<br>to discuss student progress with families.<br></p>
    <p>Use the navigation bar at the top to access the<br>students’ data. If you have any questions,<br>feedback, or updates, please email<br><a href="mailto:admin@solvedconsulting.com">admin@solvedconsulting.com</a>.</p>
  </div>
''',
          imageUrl: "assets/dummy.png",
        )
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
