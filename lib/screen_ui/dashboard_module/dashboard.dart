import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/helper_widget/app_bar_widget.dart';
import 'package:solved_dashboard/helper_widget/loading_widget.dart';
import 'package:solved_dashboard/models/dashboard_data_model.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard_model.dart';
import 'package:solved_dashboard/services/models/home_response.dart';
import 'dart:html' as html;

import 'package:solved_dashboard/utils/app_util.dart';

class Dashboard extends StatefulWidget {
  final Widget child;
  final List<Tab> tabs;

  Dashboard({required this.child, required this.tabs});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ProjectHomeViewModel model =
          Provider.of<ProjectHomeViewModel>(context, listen: false);
      model.getHomeData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProjectHomeViewModel>(context);

    HomeList dashboardData = HomeList();
    if (!model.showLoader) {
      dashboardData =
          Provider.of<DashboardData>(context, listen: false).dashboardData!;
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(model.showLoader ? 0 : 280.h),
        child: model.showLoader
            ? Container(
                height: 0,
                width: 0,
              )
            : AppBarWidget(
                logoURL: dashboardData.account != null &&
                        dashboardData.account!.schoolApp != null
                    ? dashboardData.account!.schoolApp!.appLogoC != null
                        ? dashboardData.account!.schoolApp!.appLogoC.toString()
                        : ''
                    : '',
                pageTitle: model.menuTitleValue != null &&
                        model.menuTitleValue!.isNotEmpty
                    ? model.menuTitleValue
                    : model.tabTitleValue,
                pageViewCount: '2,444',
                primaryColor: AppUtil.getColorFromHex(dashboardData.account !=
                            null &&
                        dashboardData.account!.schoolApp != null
                    ? dashboardData.account!.schoolApp!.primaryColorC != null
                        ? dashboardData.account!.schoolApp!.primaryColorC
                            .toString()
                        : ''
                    : ''),
                schoolName: dashboardData.account!.schoolApp != null
                    ? dashboardData.account!.schoolApp!.contactNameC != null
                        ? dashboardData.account!.schoolApp!.contactNameC
                            .toString()
                        : 'Bronx Bear'
                    : 'Bronx Bear',
                isBusy: model.showLoader,
                context: context,
                sectionList: model.navBarItemList,
                model: model,
              ),
      ),
      body: model.showLoader ? loadingWidget(context) : widget.child,
    );
  }
}
