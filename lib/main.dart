import 'package:flutter/material.dart';
import 'package:solved_dashboard/helper_widget/app_bar_widget.dart';
import 'package:solved_dashboard/screen_ui/assessment_module/assessment.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard.dart';
import 'package:solved_dashboard/routers/route_constants.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard_model.dart';
import 'package:solved_dashboard/screen_ui/home_module/home.dart';
import 'package:solved_dashboard/screen_ui/report_module/report.dart';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_theme.dart';
import 'package:solved_dashboard/utils/overrides.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:vrouter/vrouter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'dart:html' as html;
import 'screen_ui/home_module/home_model.dart';

void main() async {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String currentUrl = html.window.location.href;

  @override
  Widget build(BuildContext context) {
    print("Current URL ------------------------ $currentUrl");

    Uri uri = Uri.parse(currentUrl);
    String path = uri.path;
    List<String> pathSegments = path.split('/');
    if (pathSegments.length >= 2) {
      String id = pathSegments[1];
      if (id != null && id.isNotEmpty) {
        Overrides.SCHOOL_ID = id;
      }
      print("extrat id ------------$id");
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProjectHomeViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(1920, 1080),
        builder: (context, child) {
          return AdaptiveTheme(
            initial: AdaptiveThemeMode.light,
            light: AppTheme.lightTheme,
            dark: AppTheme.darkTheme,
            builder: (light, dark) {
              return VRouter(
                debugShowCheckedModeBanner: false,
                checkerboardOffscreenLayers: false,
                initialUrl: Overrides.SCHOOL_ID.isNotEmpty
                    ? '/${Overrides.SCHOOL_ID}/Home'
                    : '/Home',
                mode: VRouterMode.history,
                onPop: (vRedirector) async {
                  if (vRedirector.historyCanBack()) {
                    vRedirector.historyBack();
                  }
                },
                onSystemPop: (vRedirector) async {
                  if (vRedirector.historyCanBack()) {
                    vRedirector.historyBack();
                  }
                },
                routes: [
                  VNester(
                    path: null,
                    widgetBuilder: (child) => Dashboard(tabs: const [
                      Tab(icon: Icon(Icons.home), text: 'Home'),
                      Tab(
                          icon: Icon(Icons.supervisor_account_sharp),
                          text: 'Social'),
                      Tab(icon: Icon(Icons.settings), text: 'Settings'),
                    ], child: child),
                    nestedRoutes: [
                      // Handles the systemPop event
                      VPopHandler(
                        onSystemPop: (vRedirector) async {
                          // DO check if going back is possible
                          if (vRedirector.historyCanBack()) {
                            vRedirector.historyBack();
                          }
                        },
                        stackedRoutes: [
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Home'
                                  : '/Home',
                              widget: Home()),
                          VWidget(
                            path: Overrides.SCHOOL_ID.isNotEmpty
                                ? '/${Overrides.SCHOOL_ID}/Reports/Student_Report'
                                : '/Reports',
                            widget: Report(),
                          ),
                          VWidget(
                            path: Overrides.SCHOOL_ID.isNotEmpty
                                ? '/${Overrides.SCHOOL_ID}/Reports/Class_Report'
                                : '/Reports',
                            widget: Report(),
                          ),
                          VWidget(
                            path: Overrides.SCHOOL_ID.isNotEmpty
                                ? '/${Overrides.SCHOOL_ID}/Reports/Report_Card'
                                : '/Reports',
                            widget: Report(),
                          ),
                          VWidget(
                            path: Overrides.SCHOOL_ID.isNotEmpty
                                ? '/${Overrides.SCHOOL_ID}/Reports/School_Reports'
                                : '/Reports',
                            widget: Report(),
                          ),
                          VWidget(
                            path: Overrides.SCHOOL_ID.isNotEmpty
                                ? '/${Overrides.SCHOOL_ID}/Reports/Correlations'
                                : '/Reports',
                            widget: Report(),
                          ),
                          VWidget(
                            path: Overrides.SCHOOL_ID.isNotEmpty
                                ? '/${Overrides.SCHOOL_ID}/Reports/Dashboard_Usage'
                                : '/Reports',
                            widget: Report(),
                          ),
                          VWidget(
                            path: Overrides.SCHOOL_ID.isNotEmpty
                                ? '/${Overrides.SCHOOL_ID}/Reports/Dashboard_Permissions'
                                : '/Reports',
                            widget: Report(),
                          ),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Assessments/MAP'
                                  : '/Assessments',
                              widget: Assessment()),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Assessments/iReady'
                                  : '/Assessments',
                              widget: Assessment()),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Assessments/Acadience'
                                  : '/Assessments',
                              widget: Assessment()),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Assessments/NYS/ISA_2022'
                                  : '/Assessments',
                              widget: Assessment()),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Assessments/F&P'
                                  : '/Assessments',
                              widget: Assessment()),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Assessments/DRP'
                                  : '/Assessments',
                              widget: Assessment()),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Assessments/June_Instructional_Report'
                                  : '/Assessments',
                              widget: Assessment()),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Assessments/SEL'
                                  : '/Assessments',
                              widget: Assessment()),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Data_Insights'
                                  : '/Data_Insights',
                              widget: BasicScreen3()),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Apps'
                                  : '/Apps',
                              widget: BasicScreen4()),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Engagement'
                                  : '/Engagement',
                              widget: BasicScreen5()),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Data'
                                  : '/Data',
                              widget: BasicScreen6()),
                          VWidget(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Support'
                                  : '/Support',
                              widget: BasicScreen7()),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class BasicScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
    ));
  }
}

class BasicScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow,
    ));
  }
}

class BasicScreen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.pink,
    ));
  }
}

class BasicScreen6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.brown,
    ));
  }
}

class BasicScreen7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.orange,
    ));
  }
}
