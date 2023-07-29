import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/routers/route_constants.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard.dart';
import 'package:solved_dashboard/utils/app_theme.dart';
import 'package:vrouter/vrouter.dart';

import 'screen_ui/dashboard_module/dashboard_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1815),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, widget) {
        return AdaptiveTheme(
          light: AppTheme.lightTheme,
          dark: AppTheme.lightTheme,
          initial: AdaptiveThemeMode.light,
          debugShowFloatingThemeButton: false,
          builder: (ThemeData lightTheme, ThemeData darkTheme) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => ProjectHomeViewModel())
                //ChangeNotifierProvider(create: (_) => ProjectHomeViewModel()),
                // ChangeNotifierProvider(create: (_) => PeopleHomeViewModel()),
                // ChangeNotifierProvider(create: (_) => ProjectHomeViewModel()),
                // ChangeNotifierProvider(create: (_) => TagDetail()),
                // ChangeNotifierProvider(create: (_) => CreateProjectModel())
              ],
              child: VRouter(
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
                  //   widgetBuilder: (child) =>
                  //       Dashboard(), // Child is the widget from nestedRoutes
                  //   nestedRoutes: [
                  //     VWidget(
                  //       path: RouteConstants.homeRoute,
                  //       widget: Dashboard(),
                  //     ),
                  //     // VWidget(
                  //     //     path: RouteConstants.projectRoute,
                  //     //     widget: ProjectHome()), //l
                  //     // VWidget(path: RouteConstants.second, widget: SecondView()),
                  //     // VWidget(
                  //     //     path: RouteConstants.peopleRoute,
                  //     //     name: RouteConstants.peopleRoute,
                  //     //     stackedRoutes: [
                  //     //       VNester.builder(
                  //     //         path: '/:username',
                  //     //         widgetBuilder: (_, state, child) =>
                  //     //             Builder(builder: (context) {
                  //     //           String peopleId =
                  //     //               context.vRouter.queryParameters['id']!;

                  //     //           print("Response ------------------ ${peopleId}");

                  //     //           return ProfileDetail1(
                  //     //             peopleId: peopleId,
                  //     //           );
                  //     //         }),
                  //     //         nestedRoutes: [
                  //     //           VWidget(
                  //     //               path: RouteConstants.peopleDetails,
                  //     //               name: RouteConstants.peopleDetails,
                  //     //               widget: Builder(builder: (context) {
                  //     //                 String peopleId =
                  //     //                     context.vRouter.queryParameters['id']!;

                  //     //                 print(
                  //     //                     "Response ------------------ ${peopleId}");

                  //     //                 return ProfileDetail1(
                  //     //                   peopleId: peopleId,
                  //     //                 );
                  //     //               })),
                  //     //         ],
                  //     //       ),
                  //     //     ],
                  //     //     widget: PeopleHomeView(),
                  //     //     transitionDuration: Duration(seconds: 1)),
                  //     // VWidget(path: RouteConstants.four, widget: FourthView()),
                  //     // VWidget(path: RouteConstants.five, widget: FifthView()),
                  //     // VWidget(path: RouteConstants.six, widget: SixView()),
                  //   ],
                  // ),
                  VRouteRedirector(
                    redirectTo: RouteConstants.homeRoute,
                    path: r'*',
                  ),
                ],
              ),
            );
          },
        );
      },
    );
    // return ScreenUtilInit(
    //   //useInheritedMediaQuery: true,
    //   //splitScreenMode: false,
    //   minTextAdapt: true,
    //   splitScreenMode: true,
    //   designSize: const Size(1366, 758),
    //   builder: (context, child) => AdaptiveTheme(
    //     light: AppTheme.lightTheme,
    //     dark: AppTheme.lightTheme,
    //     initial: AdaptiveThemeMode.light,
    //     debugShowFloatingThemeButton: false,
    //     builder: (ThemeData lightTheme, ThemeData darkTheme) {
    //       return MaterialApp(
    //         title: 'Solved Dashboard',
    //         debugShowCheckedModeBanner: false,
    //         theme: lightTheme,
    //         darkTheme: darkTheme,
    //         initialRoute: '/',
    //         routes: {
    //           '/': (context) => Dashboard(),
    //         },
    //         navigatorKey: AppUtil.navigationKey,
    //       );
    //     },
    //   ),
    // );
  }
}
