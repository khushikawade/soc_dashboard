import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width <= 920;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 920 &&
        MediaQuery.of(context).size.width <= 1100;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1100;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print('<<<<<<<<<<<<constraints.maxWidth>>>>>>>>>>>>');
        print(constraints.maxWidth);
        if (constraints.maxWidth > 1100) {
          return largeScreen;
        } else if (constraints.maxWidth <= 600) {
          return mediumScreen ?? Container(color: Colors.green);
        } else {
          return mediumScreen ?? Container();
        }
      },
    );
  }
}
