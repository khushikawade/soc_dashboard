import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/helper_widget/app_bar_widget.dart';
import 'package:solved_dashboard/helper_widget/hover_animation_widget.dart';
import 'package:solved_dashboard/routers/route_constants.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard_model.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'dart:html' as html;

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
    String url = RouteConstants.homeRoute;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final model = Provider.of<ProjectHomeViewModel>(context, listen: false);
      model.buildNavBar();
      model.extractIdFromUrl(url);
      model.getHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProjectHomeViewModel>(context);
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(280.h),
        child: AppBarWidget(
          logoURL:
              'https://solved-schools.s3.us-east-2.amazonaws.com/BB-P.S.+456+Bronx-Bears/app-logos/Bronx+Bears+1024.png',
          pageTitle:
              model.menuTitleValue != null && model.menuTitleValue!.isNotEmpty
                  ? model.menuTitleValue
                  : model.tabTitleValue,
          pageViewCount: '2,444',
          primaryColor: AppColors.appPrimaryColor,
          schoolName: model.contactNameC,
          isBusy: model.showLoader,
          context: context,
          sectionList: model.navBarItemList,
          model: model,
        ),
      ),
      body: widget.child,
      // body: model.showLoader
      //     ? loadingWidget(context)
      //     : Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         mainAxisSize: MainAxisSize.max,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         //shrinkWrap: true,
      //         children: [
      //           AppBarWidget(
      //               logoURL: model.logoURL ?? '',
      //               pageViewCount: '2,444',
      //               schoolName: model.contactNameC,
      //               isBusy: model.showLoader,
      //               primaryColor: model.getColorFromHex(model.primaryColorC)),
      //           menu(model),
      //           //tabBarView(),
      //           SizedBox(
      //             height: 36.h,
      //           ),
      //           Expanded(
      //             child: ListView(
      //               shrinkWrap: true,
      //               children: [
      //                 // Home(),
      //                 PushNotificationCustomCard(
      //                   icon1: "assets/current_app_user.png",
      //                   icon2: "assets/notification.png",
      //                   icon3: "assets/push_notification_engagement.png",
      //                   icon4: "assets/social_engagement.png",
      //                   notificationText1: 'Current App Users',
      //                   notificationText2: 'Push Notifications Sent',
      //                   notificationText3: 'Push Notification Engagements',
      //                   notificationText4: 'In-App Social Engagements',
      //                   subNotificationText1: "25,456",
      //                   subNotificationText2: "10,253",
      //                   subNotificationText3: "11,045",
      //                   subNotificationText4: "18,126",
      //                 ),
      //                 Home(),

      //                 SizedBox(
      //                   height: 80.h,
      //                 ),
      //                 model.showLoader
      //                     ? ShimmerLoading(
      //                         isLoading: model.showLoader,
      //                         child: Container(
      //                           height: 79.h,
      //                           width: double.infinity,
      //                           color: Colors.white,
      //                         ),
      //                       )
      //                     : copyRightWidget(
      //                         '© 2023 Bronx Bears. All Rights Reserved.',
      //                         context,
      //                         model.getColorFromHex(model.primaryColorC)),
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
    );
  }

  // Widget menu(ProjectHomeViewModel model) {
  //   return Container(
  //     margin: EdgeInsets.only(left: 190.sp, right: 190.sp, top: 36.sp),
  //     width: double.infinity,
  //     height: 74.h,
  //     decoration: const BoxDecoration(color: AppColors.whiteColor),
  //     child: AnimatedHoverMenu(
  //       headerPosition: HeaderPosition.topLeft,
  //       headerTiles: model.navBarItemList,
  //       headerBoxDecoration: const BoxDecoration(
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(5.0),
  //           ),
  //           color: Color(0xff996617)),
  //       headerTextColor: Colors.white,
  //       headerTextSize: 15.0,
  //       menuBoxDecoration: const BoxDecoration(
  //         border: Border.fromBorderSide(
  //           BorderSide(color: Color(0xff996617), width: 2),
  //         ),
  //       ),
  //       menuTextColor: const Color(0xff996617),
  //       animationType: AnimationType.springAcrossAxis,
  //       menuTextSize: 16.0,
  //     ),
  //   );
  // }
}
