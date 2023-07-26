import 'package:injectable/injectable.dart';

@lazySingleton
class ApiEndpoints {
  String register_user = 'register';
  String otp_verify = 'app/login';
  String get_otp = 'getotp';
  String getLocation = 'app/locations/';
  String getInvestmentCategories = 'app/investment/categories';
  String getSchedules = 'app/schedules';
  String getAmount = 'app/investment/amount';
  String createInvestmentProfile = 'app/profile/create';
  String getUserProfile = 'app/profile/my';
}
