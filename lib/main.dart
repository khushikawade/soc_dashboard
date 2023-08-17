import 'package:flutter/material.dart';
import 'package:solved_dashboard/models/dashboard_data_model.dart';
import 'package:solved_dashboard/screen_ui/apps_module/apps.dart';
import 'package:solved_dashboard/screen_ui/assessment_module/assessment.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard_model.dart';
import 'package:solved_dashboard/screen_ui/data_insights_module/data_insights.dart';
import 'package:solved_dashboard/screen_ui/data_module/data.dart';
import 'package:solved_dashboard/screen_ui/data_module/data_module.dart';
import 'package:solved_dashboard/screen_ui/engegment_module/engegment.dart';
import 'package:solved_dashboard/screen_ui/home_module/home.dart';
import 'package:solved_dashboard/screen_ui/report_module/report.dart';
import 'package:solved_dashboard/screen_ui/support_module/support.dart';
import 'package:solved_dashboard/utils/app_theme.dart';
import 'package:solved_dashboard/utils/overrides.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:vrouter/vrouter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'dart:html' as html;
import 'screen_ui/data_insights_module/data_insights_model.dart';
import 'screen_ui/home_module/home_model.dart';

void main() async {
  setPathUrlStrategy();
  DashboardData dashboardData = DashboardData();
  runApp(MyApp(
    dashboardData: dashboardData,
  ));
}

class MyApp extends StatelessWidget {
  DashboardData? dashboardData = DashboardData();
  MyApp({Key? key, this.dashboardData}) : super(key: key);

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
        ChangeNotifierProvider(create: (_) => DataInsightsViewModel()),
        ChangeNotifierProvider(create: (_) => DataViewModel()),
      ],
      child: ChangeNotifierProvider<DashboardData>(
        create: (_) => dashboardData!,
        child: ScreenUtilInit(
          designSize: const Size(1920, 1080),
          builder: (context, child) {
            return AdaptiveTheme(
              initial: AdaptiveThemeMode.system,
              light: AppTheme.lightTheme,
              dark: AppTheme.darkTheme,
              builder: (light, dark) {
                return VRouter(
                  darkTheme: dark,
                  theme: light,
                  debugShowCheckedModeBanner: false,
                  checkerboardOffscreenLayers: false,
                  initialUrl: Overrides.SCHOOL_ID.isNotEmpty
                      ? '/${Overrides.SCHOOL_ID}/Home/:id'
                      : '/Home/:id',
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
                      widgetBuilder: (Widget child) {
                        return Dashboard(tabs: const [
                          Tab(icon: Icon(Icons.home), text: 'Home'),
                          Tab(
                              icon: Icon(Icons.supervisor_account_sharp),
                              text: 'Social'),
                          Tab(icon: Icon(Icons.settings), text: 'Settings'),
                        ], child: child);
                      },
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
                            // VWidget.builder(
                            //   path: Overrides.SCHOOL_ID.isNotEmpty
                            //       ? '/${Overrides.SCHOOL_ID}/Home/:id'
                            //       : '/Home/:id',
                            //   builder: (context, state) {
                            //     return Home();
                            //   },
                            // ),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Home/:id'
                                    : '/Home:id',
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
                            VWidget.builder(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Data_Insights/:id'
                                  : '/Data_Insights/:id',
                              builder: (context, state) => DataInsights(
                                  pageId: state.pathParameters['id']),
                            ),
                            // VWidget(
                            //     path: Overrides.SCHOOL_ID.isNotEmpty
                            //         ? '/${Overrides.SCHOOL_ID}/Data_Insights/:id'
                            //         : '/Data_Insights/:id',
                            //     widget: DataInsights(
                            //         id: state.pathParameters['id'] as int)),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Apps/:id'
                                    : '/Apps/:id',
                                widget: Apps()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Engagement/App_Usage'
                                    : '/Engagement',
                                widget: Engagement()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Engagement/Digital_Forms'
                                    : '/Engagement',
                                widget: Engagement()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Engagement/Website_Usage'
                                    : '/Engagement',
                                widget: Engagement()),
                            VWidget.builder(
                              path: Overrides.SCHOOL_ID.isNotEmpty
                                  ? '/${Overrides.SCHOOL_ID}/Data/:id'
                                  : '/Data/:id',
                              builder: (context, state) =>
                                  Data(pageId: state.pathParameters['id']),
                            ),
                            // VWidget(
                            //     path: Overrides.SCHOOL_ID.isNotEmpty
                            //         ? '/${Overrides.SCHOOL_ID}/Data:id'
                            //         : '/Data:id',
                            //     widget: Data()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Support/HS_Dashboard'
                                    : '/Support',
                                widget: Support()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Support/Mobile_Dashboard'
                                    : '/Support',
                                widget: Support()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Support/Student_Feedback'
                                    : '/Support',
                                widget: Support()),
                            //=====================SUBSECTION===========================
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/MAP/MAP_Math'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/MAP/MAP_ELA'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/iReady/iReady_Math'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/iReady/iReady_ELA'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/Acadience/Acadience_Math'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/Acadience/Acadience_ELA'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/NYS/ISA_2022/NYS_Math_2022'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/NYS/ISA_2022/NYS_ELA_2022'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/NYS/ISA_2022/ISA_Math_by_Class'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/NYS/ISA_2022/ISA_ELA_by_Class'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/NYS/ISA_2022/ISA_Math_by_Student'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/NYS/ISA_2022/ISA_ELA_by_Student'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/June_Instructional_Report/Total_Number_of_Questions'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/June_Instructional_Report/JIR_Math'
                                    : '/Assessments',
                                widget: Assessment()),
                            VWidget(
                                path: Overrides.SCHOOL_ID.isNotEmpty
                                    ? '/${Overrides.SCHOOL_ID}/Assessments/June_Instructional_Report/JIR_ELA'
                                    : '/Assessments',
                                widget: Assessment()),
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
      ),
    );
  }
}
