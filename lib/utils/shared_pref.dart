import 'package:shared_preferences/shared_preferences.dart';

class SharedPre {
  static const String LOGIN_TOKEN = "accessToken";
  static const String refreshToke = "refresh_toke";
  static const String deviceToke = "device_toke";
  static const String endPointArn = "end_point_arn";
  static const String isLogin = "isLogin";
  static const String NAME = "name";
  static const String EMAIL = "email";
  static const String PASSWORD = "password";
  static const String REMEMBER = "remember";
  static const String Mobile = "mobile";
  static const String countryCode = "countryCode";
  static const String profileImage = "profileImage";
  static const String userId = "userId";
  static const String unreadcount = "unreadcount";
  static const String storeId = "storeId";
  static const String unreadmsg = "unreadmsg";
  static const String setTime = "setTime";
  static const String LOGIN_FQDN = "fqdn";
  static const String IMAGE = "image";

  static setStringValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static setBoolValue(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static setIntValue(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static getStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key) ? prefs.getString(key) : "";
  }

  static getIntValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key) ? prefs.getInt(key) : -1;
  }

  static getBoolValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key) ? prefs.getBool(key) : false;
  }

  static clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
