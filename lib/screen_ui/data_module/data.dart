import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/helper_widget/common_widget/iframe_custom_link_widget.dart';
import 'package:solved_dashboard/helper_widget/copy_right_widget.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/loading_widget.dart';
import 'package:solved_dashboard/models/dashboard_data_model.dart';
import 'package:solved_dashboard/services/models/home_response.dart';
import 'package:solved_dashboard/utils/app_util.dart';
import 'package:solved_dashboard/view_model/section_data_view_model.dart';

class Data extends StatefulWidget {
  String? pageId;
  Data({this.pageId});
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  void initState() {
    super.initState();
    print("Selected ID or page Id ------------- ${widget.pageId}");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final model = Provider.of<SectionDataViewModel>(context, listen: false);
      model.getDataInsightsData(context, widget.pageId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeList dashboardData =
        Provider.of<DashboardData>(context, listen: false).dashboardData!;
    final dataViewModel = Provider.of<SectionDataViewModel>(context);
    return dataViewModel.showLoader
        ? loadingWidget(context)
        : ListView(
            children: [
              ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                // padding: EdgeInsets.only(
                //     left: 190.sp, right: 190.sp, top: 36.sp, bottom: 80.sp),
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 190.sp, right: 190.sp, top: 40.sp),
                    child: pageTitleTextWidget(
                        dataViewModel.homeDetails!.titleC != null &&
                                dataViewModel.homeDetails!.titleC!.isNotEmpty
                            ? dataViewModel.homeDetails!.titleC
                            : '+ Data',
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
                        dynamicLinkUrl: dataViewModel.homeDetails != null
                            ? "https://services.solvedconsulting.net/news/a1f4W000007DQaNQAW"
                            : "https://services.solvedconsulting.net/news/a1f4W000007DQaNQAW",
                      ),
                    ),
                  ),
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
}
