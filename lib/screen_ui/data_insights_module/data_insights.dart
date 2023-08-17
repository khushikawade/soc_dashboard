import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/helper_widget/common_widget/iframe_custom_link_widget.dart';
import 'package:solved_dashboard/helper_widget/copy_right_widget.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/loading_widget.dart';
import 'package:solved_dashboard/models/dashboard_data_model.dart';
import 'package:solved_dashboard/screen_ui/data_insights_module/data_insights_model.dart';
import 'package:solved_dashboard/services/models/home_response.dart';
import 'package:solved_dashboard/utils/app_util.dart';

class DataInsights extends StatefulWidget {
  String? pageId;
  DataInsights({this.pageId});
  @override
  _DataInsightsState createState() => _DataInsightsState();
}

class _DataInsightsState extends State<DataInsights> {
  @override
  void initState() {
    super.initState();
    print("Selected ID or page Id ------------- ${widget.pageId}");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final model = Provider.of<DataInsightsViewModel>(context, listen: false);
      model.getDataInsightsData(context, widget.pageId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeList dashboardData =
        Provider.of<DashboardData>(context, listen: false).dashboardData!;
    final dataInsightsViewModel = Provider.of<DataInsightsViewModel>(context);
    return dataInsightsViewModel.showLoader
        ? loadingWidget(context)
        : Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 190.sp, right: 190.sp, top: 40.sp),
                      child: pageTitleTextWidget(
                          dataInsightsViewModel.homeDetails!.titleC != null &&
                                  dataInsightsViewModel
                                      .homeDetails!.titleC!.isNotEmpty
                              ? dataInsightsViewModel.homeDetails!.titleC
                              : 'Data Insights',
                          context),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 190.sp,
                        right: 190.sp,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 1.5.h,
                        child: IFrameCustomWidget(
                          titleText: "",
                          subTitleText: "",
                          dynamicLinkUrl:
                              // dataInsightsViewModel.homeDetails !=
                              //         null
                              //     ? dataInsightsViewModel.homeDetails!.embedUrlC
                              //         .toString()
                              //     :
                              "https://services.solvedconsulting.net/news/a1f4W000007DQaNQAW",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
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
}
