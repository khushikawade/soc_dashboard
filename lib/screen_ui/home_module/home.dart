import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/helper_widget/common_widget/one_column_text_and_image_right.dart';
import 'package:solved_dashboard/helper_widget/common_widget/three_column_text_and_image.dart';
import 'package:solved_dashboard/helper_widget/copy_right_widget.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/loading_widget.dart';
import 'package:solved_dashboard/models/dashboard_data_model.dart';
import 'package:solved_dashboard/services/models/home_detail_model.dart';
import 'package:solved_dashboard/services/models/home_response.dart';
import 'package:solved_dashboard/utils/app_util.dart';
import 'package:solved_dashboard/view_model/section_data_view_model.dart';
import 'dart:html' as html;

class Home extends StatefulWidget {
  String? pageId;
  Home({this.pageId});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // String currentUrl = html.window.location.href;
    // print("Current URL ------------------------ $currentUrl");

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final model = Provider.of<SectionDataViewModel>(context, listen: false);
    //   model.getDataInsightsData(context, model.extractIdFromUrl(currentUrl));
    // });
  }

  @override
  Widget build(BuildContext context) {
    HomeList dashboardData =
        Provider.of<DashboardData>(context, listen: false).dashboardData!;
    HomDetail dataViewModel =
        Provider.of<DashboardData>(context, listen: false).getHomeDetail!;
    //final dataViewModel = Provider.of<SectionDataViewModel>(context);

    return dataViewModel.id == null
        ? loadingWidget(context)
        : ListView(
            //shrinkWrap: true,
            children: [
              ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                    left: 190.sp, right: 190.sp, top: 36.sp, bottom: 80.sp),
                children: [
                  pageTitleTextWidget(
                      dataViewModel.titleC ?? 'Latest Dashboard Features',
                      context),
                  SizedBox(
                    height: 42.h,
                  ),
                  ThreeColumnTextAndImageWidget(
                    titleTextCard1: "",
                    subTitleTextCard1:
                        dataViewModel.subTitle1C ?? "Grades & Report Cards",
                    detailDescriptionCard1: dataViewModel.text1C ?? 'N/A'
                    //           '''
                    // <div>
                    // <p>- Marking Period 1 <br>
                    // - ELA, MATH, Science, Social Studies<br>
                    // - Available in <a href="https://lookerstudio.google.com/u/0/reporting/75743c2d-5749-45e7-9562-58d0928662b2/page/m87aB">Student Reports</a> &amp; <a href="https://lookerstudio.google.com/u/0/reporting/75743c2d-5749-45e7-9562-58d0928662b2/page/p_9grki1pw2c">Report Card</a><br></p>
                    // </div>
                    // '''
                    ,
                    imageUrlCard1:
                        dataViewModel.image1LinkC ?? 'assets/tabel.png',
                    subTitleTextCard2:
                        dataViewModel.subTitle2C ?? "Correlations",
                    detailDescriptionCard2: dataViewModel.text2C ?? 'N/A'

                    // <div>
                    // <p>-NYS Assessment Scores vs iReady/MAP Scores<br>
                    // -Targeted Quadrants for Intervention<br>
                    // - Available in <a href="https://lookerstudio.google.com/u/0/reporting/75743c2d-5749-45e7-9562-58d0928662b2/page/p_8xqg8a182c">Correlations Report</a><br></p>
                    // </div>
                    // '''
                    ,
                    imageUrlCard2:
                        dataViewModel.image2LinkC ?? "assets/graph.png",
                    subTitleTextCard3: dataViewModel.subTitle3C ?? "N/A",
                    detailDescriptionCard3: dataViewModel.text3C ?? "N/A"
                    //       '''
                    // <div>
                    // <p>-Weekly Data Deep Dives directly to your email <br>
                    // -Data-Driven Professional Development<br>&nbsp &nbsp Resources<br>
                    // - Available in <a href="https://lookerstudio.google.com/u/0/reporting/75743c2d-5749-45e7-9562-58d0928662b2/page/p_ef0a9fdm4c">Data Insights</a><br></p>
                    // </div>
                    // '''
                    ,
                    imageUrlCard3:
                        dataViewModel.image3LinkC ?? "assets/data_inside.png",
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
                  ),
                  //     SizedBox(
                  //       height: 56.h,
                  //     ),
                  //     const OneColumnTextAndImageLeftWidget(
                  //       titleText: "Title Here",
                  //       subTitleText: "Praesent lobortis metus ex.",
                  //       detailDescription: '''
                  // <div>
                  // <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut placerat libero.
                  //  In sed lorem at turpis cursus imperdiet nec at dui. Aenean tortor mauris,
                  //  consequat non imperdiet vel, tristique nec urna. Mauris et imperd
                  //  iet ligula, imperdiet lacinia leo. Curabitur dictum veli<br><br>varius, viverra
                  //  Etiam hendrerit dui vel enim dignissim tempus. Pellentesque hendrerit enim sodales, commodo sapien sed, hendrerit mi. Integer facilisis mauris a nunc euismod, id fermentum</p>
                  //  <br><br>varius, viverra
                  //  Etiam hendrerit dui vel enim dignissim tempus. Pellentesque hendrerit enim sodales, commodo sapien sed, hendrerit mi. Integer facilisis mauris a nunc euismod, id fermentum</p>

                  // </div>
                  // ''',
                  //       imageUrl: "assets/one_column_image.png",
                  //     ),
                  //     SizedBox(
                  //       height: 56.h,
                  //     ),
                  //     const TwoColumnTextAndImageWidget(
                  //       titleTextCard1: "",
                  //       subTitleTextCard1: "Praesent lobortis metus ex.",
                  //       subTitleTextCard2: "Praesent lobortis metus ex.",
                  //       detailDescriptionCard1: '''
                  // <div>
                  // <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut placerat<br>libero.
                  //  In sed lorem at turpis cursus imperdiet nec at dui. Aenean tortor<br>mauris, consequat non imperdiet vel, tristique nec urna.</p>

                  // </div>
                  // ''',
                  //       detailDescriptionCard2: '''
                  // <div>
                  // <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut placerat<br>libero.
                  //  In sed lorem at turpis cursus imperdiet nec at dui. Aenean tortor<br>mauris, consequat non imperdiet vel, tristique nec urna.</p>

                  // </div>
                  // ''',
                  //       imageUrlCard1: "assets/hannah.png",
                  //       imageUrlCard2: "assets/hannah.png",
                  //     ),
                  // SizedBox(
                  //   height: 56.h,
                  // ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   height: MediaQuery.of(context).size.height / 1.5.h,
                  //   child: const IFrameCustomWidget(
                  //     titleText: "Data Insights Widget",
                  //     subTitleText: "Title Here",
                  //     dynamicLinkUrl:
                  //         "https://services.solvedconsulting.net/news/a1f4W000007DQaNQAW",
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 56.h,
                  // ),
                ],
              ),
              copyRightWidget(
                '© 2023 Bronx Bears. All Rights Reserved.',
                context,
                AppUtil.getColorFromHex(dashboardData.account != null &&
                        dashboardData.account!.schoolApp != null
                    ? dashboardData.account!.schoolApp!.primaryColorC != null
                        ? dashboardData.account!.schoolApp!.primaryColorC
                            .toString()
                        : ''
                    : ''),
              ),
            ],
          );
  }

  // apiCallforHome() {
  //   HomDetail dashboardData =
  //       Provider.of<DashboardData>(context, listen: false).getHomeDetail!;
  //   print(dashboardData);
  // }
}
//-----------------
