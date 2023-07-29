import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/custom_fonts/solved_dashboard_icons_icons.dart';
import 'package:solved_dashboard/helper_widget/app_bar_widget.dart';
import 'package:solved_dashboard/helper_widget/copy_right_widget.dart';
import 'package:solved_dashboard/helper_widget/tabbar_item_widget.dart';
import 'package:solved_dashboard/helper_widget/vertical_divider_widget.dart';
import 'package:solved_dashboard/screen_ui/engegment_module/engegment.dart';
import 'package:solved_dashboard/screen_ui/home_module/home.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Material(
      child: MediaQuery(
        data: mediaQueryData.copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: AppColors.pageBGColor,
          //bottomSheet: copyRightWidget('© 2023 Bronx Bears. All Rights Reserved.'),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(500.h),
              child: const AppBarWidget(
                logoURL:
                    'https://solved-schools.s3.us-east-2.amazonaws.com/BB-P.S.+456+Bronx-Bears/app-logos/Bronx+Bears+1024.png',
                pageViewCount: '2,444',
              )),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            //shrinkWrap: true,
            children: [
              tabBarView(),
              SizedBox(
                height: 36.h,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Home(),
                    copyRightWidget(
                        '© 2023 Bronx Bears. All Rights Reserved.', context),
                  ],
                ),
              )
            ],
          ),
          //body: Engagement(),
        ),
      ),
    );
  }

  // Make widget that will create custom tabbar view
  Widget tabBarView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 190.sp, right: 190.sp, top: 36.sp),
          width: double.infinity,
          //height: 74.h,
          decoration: BoxDecoration(color: AppColors.whiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: tabBarItemWidget(
                    'Home', true, SolvedDashboardIcons.frame_238, context),
              ),
              verticalDivider(),
              Expanded(
                child: tabBarItemWidget(
                    'Reports', false, SolvedDashboardIcons.frame_239, context,
                    dropDownIcon: Icons.arrow_drop_down),
              ),
              verticalDivider(),
              Expanded(
                  child: tabBarItemWidget('Assessments', false,
                      SolvedDashboardIcons.frame_240, context,
                      dropDownIcon: Icons.arrow_drop_down)),
              verticalDivider(),
              Expanded(
                child: tabBarItemWidget(
                  'Data Insights',
                  false,
                  SolvedDashboardIcons.frame_241,
                  context,
                ),
              ),
              verticalDivider(),
              Expanded(
                child: tabBarItemWidget(
                    'Apps+', false, SolvedDashboardIcons.frame_245, context,
                    dropDownIcon: Icons.arrow_drop_down),
              ),
              verticalDivider(),
              Expanded(
                child: tabBarItemWidget('Engagement', false,
                    SolvedDashboardIcons.frame_242, context,
                    dropDownIcon: Icons.arrow_drop_down),
              ),
              verticalDivider(),
              Expanded(
                child: tabBarItemWidget(
                  '+ Data',
                  false,
                  SolvedDashboardIcons.frame_243,
                  context,
                ),
              ),
              verticalDivider(),
              Expanded(
                child: tabBarItemWidget(
                    'Support', false, SolvedDashboardIcons.frame_244, context,
                    dropDownIcon: Icons.arrow_drop_down),
              ),
            ],
          ),
        ),
        _isHovering
            ? Container(
                width: 500.w,
                height: 500.h,
                color: Colors.red,
              )
            : Container()
      ],
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
  }
}

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String name = 'bob';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Enter your name to connect: '),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      onChanged: (value) => name = value,
                      initialValue: 'bob',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            // This FAB is shared and shows hero animations working with no issues
            FloatingActionButton(
              heroTag: 'FAB',
              onPressed: () {},
              child: Icon(Icons.login),
            )
          ],
        ),
      ),
    );
  }
}
