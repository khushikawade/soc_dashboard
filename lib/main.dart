import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/common_widget/iframe_custom_link_widget.dart';
import 'package:solved_dashboard/screen_ui/dashboard_module/dashboard.dart';
import 'package:solved_dashboard/utils/app_theme.dart';
import 'package:solved_dashboard/utils/app_util.dart';

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
      useInheritedMediaQuery: false,
      rebuildFactor: (old, data) {
        return true;
      },
      designSize: const Size(1920, 1815),
      //designSize: const Size(375, 812),
      builder: (context, child) {
        return AdaptiveTheme(
          light: AppTheme.lightTheme,
          dark: AppTheme.lightTheme,
          initial: AdaptiveThemeMode.light,
          debugShowFloatingThemeButton: false,
          builder: (ThemeData lightTheme, ThemeData darkTheme) {
            return MaterialApp(
              title: 'Solved Dashboard',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              initialRoute: '/',
              routes: {
                '/': (context) => const IFrameCustomWidget(
                    titleText: "Data Insights Widget",
                    subTitleText: "Title Here",
                    dynamicLinkUrl:
                        "https://services.solvedconsulting.net/news/a1f4W000007DQaNQAW"),
              },
              navigatorKey: AppUtil.navigationKey,
            );
          },
        );
      },
    );
  }
}
