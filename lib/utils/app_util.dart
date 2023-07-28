import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class AppUtil {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static Future<bool> checkNetwork() async {
    if (Platform.isAndroid) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        return true;
      } else {
        return false;
      }
    } else {
      try {
        final result = await InternetAddress.lookup('example.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print('connected');
        }
        return true;
      } on SocketException catch (_) {
        print('not connected');
        return false;
      }
    }
  }

  static showDialogbox(BuildContext context, title,
      {Function? myTestFunction}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container();
          // return ErrorBoxWidget(
          //     title: title ?? "Oops Something Went Wrong",
          //     onClick: myTestFunction);
        });
  }

  static showSuccessDialogbox(BuildContext context, title,
      {Function? myTestFunction}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container();
          // return SuccessBoxWidget(
          //     title: title ?? "Oops Something Went Wrong",
          //     onClick: myTestFunction);
        });
  }

  static BuildContext getContext() {
    return navigationKey.currentContext!;
  }

  static Widget showCircularProgress(Color color) {
    return CircularProgressIndicator(
      color: color,
    );
  }

  static String formatTime(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate = DateFormat('d MMMM, hh:mm a').format(dateTime);
    return formattedDate;
  }

  static String formatDate(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate =
        dateTime.toLocal().toIso8601String().substring(0, 10);
    return formattedDate;
  }

  static String time(TimeOfDay time, context) {
    String timeString = time.format(context);
    return timeString;
  }

  static String formatDateDDMMYY(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    final formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return formattedDate;
  }

  static String formatDateMonth(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    // final formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    String formattedDate = DateFormat('d MMMM').format(dateTime);
    return formattedDate;
  }

  static showSnackBar(String content) {
    ScaffoldMessenger.of(getContext()).hideCurrentSnackBar();
    ScaffoldMessenger.of(getContext()).showSnackBar(SnackBar(
      content: Text(
        content,
        style: const TextStyle(color: AppColors.black),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 70, left: 16, right: 16),
    ));
  }

  static printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  // // show toast on screen
  // static void showToast(String msg) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       fontSize: 16.0);
  // }

  static Map<String, String> getJsonHeader() {
    Map<String, String> header = {};
    header[HttpHeaders.contentTypeHeader] = 'application/json';
    return header;
  }

  // Show loading dialog
  static void showLoadingDialog({BuildContext? context, String? msg}) async {
    return showDialog<void>(
        useRootNavigator: false,
        context: context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
              backgroundColor: Color(0xffF7F8F9),
              children: <Widget>[
                Container(
                  // height: Globals.deviceType == 'phone' ? 80 : 100,
                  // width: Globals.deviceType == 'phone'
                  //     ? MediaQuery.of(context).size.width * 0.4
                  //     : MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   child: FittedBox(
                      //     child: Utility.textWidget(
                      //         text: msg ?? 'Please Wait...',
                      //         context: context,
                      //         textTheme: Theme.of(context)
                      //             .textTheme
                      //             .headline6!
                      //             .copyWith(
                      //               color: Color(0xff000000) !=
                      //                       Theme.of(context)
                      //                           .backgroundColor
                      //                   ? Color(0xffFFFFFF)
                      //                   : Color(0xff000000),
                      //               fontSize: Globals.deviceType == "phone"
                      //                   ? AppTheme.kBottomSheetTitleSize
                      //                   : AppTheme.kBottomSheetTitleSize *
                      //                       1.3,
                      //             )),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: CircularProgressIndicator(
                          color: AppColors.appPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              ]);
        });
  }

  
}
