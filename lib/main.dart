import 'package:flutter/material.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard.dart';
import 'package:solved_dashboard/routers/route_constants.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard_model.dart';
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
            initial: AdaptiveThemeMode.system,
            light: AppTheme.lightTheme,
            dark: AppTheme.darkTheme,
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
