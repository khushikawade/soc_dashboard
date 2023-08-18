import 'dart:convert';
import 'package:http/http.dart';
import 'package:solved_dashboard/services/api_client.dart';
import 'package:solved_dashboard/services/api_methods.dart';
import 'package:solved_dashboard/services/models/home_detail_model.dart';
import 'package:solved_dashboard/services/models/home_response.dart';

class Api {
  final ApiEndpoints _apiMethods = ApiEndpoints();
  final ApiClient _apiClient = ApiClient();

  //Get Otp  API
  Future<HomeResponse> getHomeData(String schoolID) async {
    // if (!internet) {
    //   return HomeResponse(error: Constants.noInternet, statusCode: 501);
    // }
    // final Map<String, String> queryParams = {
    //   'schoolId': schoolID,
    //   'objectName': objectName
    //   // Add more parameters as needed
    // };
    Response response = await _apiClient.getMethod('${_apiMethods.home}' +
            '/${schoolID}' //'?schoolID=$schoolID&objectName=$objectName',
        );
    print("Request URL ---------- ${response.request}");
    if (response.statusCode == 200) {
      try {
        if (response.body.contains('error')) {
          var jsonResponse = json.decode(response.body);
          return HomeResponse(
              error: jsonResponse['error']['message'], statusCode: 500);
        } else {
          HomeResponse resp = homeResponseFromJson(response.body);
          resp.statusCode = response.statusCode;
          return resp;
        }
      } catch (e) {
        print("errror------------$e");
        return HomeResponse(
            error: e.toString(), statusCode: response.statusCode);
      }
    } else if (response.statusCode == 422) {
      print("========================00error");
      var jsonResponse = json.decode(response.body);
      return HomeResponse(
          error: jsonResponse["message"], statusCode: response.statusCode);
    } else {
      print("========================0000error");
      var jsonResponse = json.decode(response.body);
      return HomeResponse(
          error: jsonResponse["message"], statusCode: response.statusCode);
    }
  }

  Future<HomeDataModel> getDetailDataOfHome(
      String id, String section_Type) async {
    Response response = await _apiClient.getMethod(
        '${_apiMethods.detailOfHome}' +
            '/${id}/${section_Type}' //'?schoolID=$schoolID&objectName=$objectName',
        );

    print("Request URL ---------- ${response.request}");
    if (response.statusCode == 200) {
      try {
        if (response.body.contains('error')) {
          var jsonResponse = json.decode(response.body);
          return HomeDataModel(
              error: jsonResponse['error']['message'], statusCode: 500);
        } else {
          HomeDataModel resp = homeDataModelFromJson(response.body);
          resp.statusCode = response.statusCode;
          return resp;
        }
      } catch (e) {
        print("errror------------$e");
        return HomeDataModel(
            error: e.toString(), statusCode: response.statusCode);
      }
    } else if (response.statusCode == 422) {
      print("========================00error");
      var jsonResponse = json.decode(response.body);
      return HomeDataModel(
          error: jsonResponse["message"], statusCode: response.statusCode);
    } else {
      print("========================0000error");
      var jsonResponse = json.decode(response.body);
      return HomeDataModel(
          error: jsonResponse["message"], statusCode: response.statusCode);
    }
  }
}
