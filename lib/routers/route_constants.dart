import 'package:solved_dashboard/utils/overrides.dart';

class RouteConstants {
  static String loginRoute = "/login";
  static String homeRoute = Overrides.SCHOOL_ID.isNotEmpty
      ? "/${Overrides.SCHOOL_ID}/home"
      : "/a226w000000h58MAAQ/home";
  static String projectRoute = "project";
  static const String peopleRoute = "people";
  static const String second = "second";
  static const String peopleDetails = "peopleDetails";
  static const String four = "four";
  static const String five = "five";
  static const String six = "six";
}
