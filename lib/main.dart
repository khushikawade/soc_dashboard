import 'package:flutter/material.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard.dart';
import 'package:solved_dashboard/routers/route_constants.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard_model.dart';
import 'package:solved_dashboard/utils/app_theme.dart';
import 'package:vrouter/vrouter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProjectHomeViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: Size(1920, 1080),
        builder: (context, child) {
          return AdaptiveTheme(
            initial: AdaptiveThemeMode.light,
            light: AppTheme.lightTheme,
            dark: AppTheme.lightTheme,
            builder: (light, dark) {
              return VRouter(
                theme: light,
                darkTheme: dark,
                debugShowCheckedModeBanner: false,
                mode: VRouterMode.history,
                initialUrl: RouteConstants.homeRoute,
                routes: [
                  VWidget(
                    path: RouteConstants.homeRoute,
                    widget: Dashboard(),
                  ),
                  // VNester(
                  //   path: RouteConstants.homeRoute,
                  //   widgetBuilder: (child) => MyHomePage1(
                  //       child: child,
                  //       currentIndex:
                  //           1), // Child is the widget from nestedRoutes
                  //   nestedRoutes: [
                  //     VWidget(
                  //         path: RouteConstants.projectRoute,
                  //         widget: ProjectHome()), //l
                  //     VWidget(
                  //         path: RouteConstants.second, widget: SecondView()),
                  //     VWidget(
                  //         path: RouteConstants.peopleRoute,
                  //         name: RouteConstants.peopleRoute,
                  //         stackedRoutes: [
                  //           VNester.builder(
                  //             path: '/:username',
                  //             widgetBuilder: (_, state, child) =>
                  //                 Builder(builder: (context) {
                  //               String peopleId =
                  //                   context.vRouter.queryParameters['id']!;

                  //               print(
                  //                   "Response ------------------ ${peopleId}");

                  //               return ProfileDetail1(
                  //                 peopleId: peopleId,
                  //               );
                  //             }),
                  //             nestedRoutes: [
                  //               VWidget(
                  //                   path: RouteConstants.peopleDetails,
                  //                   name: RouteConstants.peopleDetails,
                  //                   widget: Builder(builder: (context) {
                  //                     String peopleId = context
                  //                         .vRouter.queryParameters['id']!;

                  //                     print(
                  //                         "Response ------------------ ${peopleId}");

                  //                     return ProfileDetail1(
                  //                       peopleId: peopleId,
                  //                     );
                  //                   })),
                  //             ],
                  //           ),
                  //         ],
                  //         widget: PeopleHomeView(),
                  //         transitionDuration: Duration(seconds: 1)),
                  //     VWidget(path: RouteConstants.four, widget: FourthView()),
                  //     VWidget(path: RouteConstants.five, widget: FifthView()),
                  //     VWidget(path: RouteConstants.six, widget: SixView()),
                  //   ],
                  // ),
                  VRouteRedirector(
                    redirectTo: RouteConstants.homeRoute,
                    path: r'*',
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
