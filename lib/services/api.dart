import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:solved_dashboard/services/api_client.dart';
import 'package:solved_dashboard/services/api_methods.dart';

@lazySingleton
class Api {
  final ApiEndpoints _apiMethods = ApiEndpoints();
  final ApiClient _apiClient = ApiClient();

  // // Register API
  // Future<RegisterUserResp> registerApi(var body) async {
  //   bool internet = await AppUtil.checkNetwork();
  //   if (!internet) {
  //     return RegisterUserResp(error: Constants.noInternet, status: 501);
  //   }
  //   Response response = await _apiClient.postMethod(
  //     _apiMethods.register_user,
  //     body,
  //   );

  //   if (response.statusCode == 200) {
  //     try {
  //       if (response.body.contains('error')) {
  //         var jsonResponse = json.decode(response.body);
  //         return RegisterUserResp(
  //             error: jsonResponse['error']['message'], status: 500);
  //       } else {
  //         RegisterUserResp resp = registerUserRespFromJson(response.body);
  //         resp.status = response.statusCode;
  //         return resp;
  //       }
  //     } catch (e) {
  //       return RegisterUserResp(
  //           error: e.toString(), status: response.statusCode);
  //     }
  //   } else if (response.statusCode == 422) {
  //     var jsonResponse = json.decode(response.body);
  //     return RegisterUserResp(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   } else {
  //     var jsonResponse = json.decode(response.body);
  //     return RegisterUserResp(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   }
  // }

  // // Otp Verify API
  // Future<OtpVerifyResp> otpVerifyApi(var body) async {
  //   bool internet = await AppUtil.checkNetwork();
  //   if (!internet) {
  //     return OtpVerifyResp(error: Constants.noInternet, status: 501);
  //   }
  //   Response response = await _apiClient.postMethod(
  //     _apiMethods.otp_verify,
  //     body,
  //   );

  //   if (response.statusCode == 200) {
  //     try {
  //       if (response.body.contains('error')) {
  //         var jsonResponse = json.decode(response.body);
  //         return OtpVerifyResp(
  //             error: jsonResponse['error']['message'], status: 500);
  //       } else {
  //         OtpVerifyResp resp = otpVerifyRespFromJson(response.body);
  //         resp.status = response.statusCode;
  //         return resp;
  //       }
  //     } catch (e) {
  //       return OtpVerifyResp(error: e.toString(), status: response.statusCode);
  //     }
  //   } else if (response.statusCode == 422) {
  //     var jsonResponse = json.decode(response.body);
  //     return OtpVerifyResp(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   } else {
  //     var jsonResponse = json.decode(response.body);
  //     return OtpVerifyResp(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   }
  // }

  // //Get Otp  API
  // Future<GetOtpResp> getOtpApi(var body) async {
  //   bool internet = await AppUtil.checkNetwork();
  //   if (!internet) {
  //     return GetOtpResp(error: Constants.noInternet, status: 501);
  //   }
  //   Response response = await _apiClient.postMethod(
  //     _apiMethods.get_otp,
  //     body,
  //   );

  //   if (response.statusCode == 200) {
  //     try {
  //       if (response.body.contains('error')) {
  //         var jsonResponse = json.decode(response.body);
  //         return GetOtpResp(
  //             error: jsonResponse['error']['message'], status: 500);
  //       } else {
  //         GetOtpResp resp = getOtpRespFromJson(response.body);
  //         resp.status = response.statusCode;
  //         return resp;
  //       }
  //     } catch (e) {
  //       return GetOtpResp(error: e.toString(), status: response.statusCode);
  //     }
  //   } else if (response.statusCode == 422) {
  //     var jsonResponse = json.decode(response.body);
  //     return GetOtpResp(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   } else {
  //     var jsonResponse = json.decode(response.body);
  //     return GetOtpResp(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   }
  // }

  // //Get Otp  API
  // Future<LocationApiResponse> getLocationApi() async {
  //   String token = await SharedPre.getStringValue(SharedPre.LOGIN_TOKEN);
  //   bool internet = await AppUtil.checkNetwork();
  //   if (!internet) {
  //     return LocationApiResponse(error: Constants.noInternet, status: 501);
  //   }
  //   Response response = await _apiClient.getMethod(
  //     '${_apiMethods.getLocation}2229',
  //     headers: token != null && token.isNotEmpty
  //         ? {"Authorization": "Bearer $token"}
  //         : null,
  //   );

  //   if (response.statusCode == 200) {
  //     try {
  //       if (response.body.contains('error')) {
  //         var jsonResponse = json.decode(response.body);
  //         return LocationApiResponse(
  //             error: jsonResponse['error']['message'], status: 500);
  //       } else {
  //         LocationApiResponse resp = locationApiResponseFromJson(response.body);
  //         resp.status = response.statusCode;
  //         return resp;
  //       }
  //     } catch (e) {
  //       return LocationApiResponse(
  //           error: e.toString(), status: response.statusCode);
  //     }
  //   } else if (response.statusCode == 422) {
  //     var jsonResponse = json.decode(response.body);
  //     return LocationApiResponse(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   } else {
  //     var jsonResponse = json.decode(response.body);
  //     return LocationApiResponse(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   }
  // }

  // // Call API to get investment categories
  // Future<InvestmentCategoriesResponse> getInvestmentCategoriesApi() async {
  //   String token = await SharedPre.getStringValue(SharedPre.LOGIN_TOKEN);
  //   bool internet = await AppUtil.checkNetwork();
  //   if (!internet) {
  //     return InvestmentCategoriesResponse(
  //         error: Constants.noInternet, status: 501);
  //   }
  //   Response response = await _apiClient.getMethod(
  //     _apiMethods.getInvestmentCategories,
  //     headers: token != null && token.isNotEmpty
  //         ? {"Authorization": "Bearer $token"}
  //         : null,
  //   );

  //   if (response.statusCode == 200) {
  //     try {
  //       if (response.body.contains('error')) {
  //         var jsonResponse = json.decode(response.body);
  //         return InvestmentCategoriesResponse(
  //             error: jsonResponse['error']['message'], status: 500);
  //       } else {
  //         InvestmentCategoriesResponse resp =
  //             investmentCategoriesResponseFromJson(response.body);
  //         resp.status = response.statusCode;
  //         return resp;
  //       }
  //     } catch (e) {
  //       return InvestmentCategoriesResponse(
  //           error: e.toString(), status: response.statusCode);
  //     }
  //   } else if (response.statusCode == 422) {
  //     var jsonResponse = json.decode(response.body);
  //     return InvestmentCategoriesResponse(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   } else {
  //     var jsonResponse = json.decode(response.body);
  //     return InvestmentCategoriesResponse(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   }
  // }

  // // Call API to get schedules
  // Future<ScheduleResponse> getSchedulesApi() async {
  //   String token = await SharedPre.getStringValue(SharedPre.LOGIN_TOKEN);
  //   bool internet = await AppUtil.checkNetwork();
  //   if (!internet) {
  //     return ScheduleResponse(error: Constants.noInternet, status: 501);
  //   }
  //   Response response = await _apiClient.getMethod(
  //     _apiMethods.getSchedules,
  //     headers: token != null && token.isNotEmpty
  //         ? {"Authorization": "Bearer $token"}
  //         : null,
  //   );

  //   if (response.statusCode == 200) {
  //     try {
  //       if (response.body.contains('error')) {
  //         var jsonResponse = json.decode(response.body);
  //         return ScheduleResponse(
  //             error: jsonResponse['error']['message'], status: 500);
  //       } else {
  //         ScheduleResponse resp = scheduleResponseFromJson(response.body);
  //         resp.status = response.statusCode;
  //         return resp;
  //       }
  //     } catch (e) {
  //       return ScheduleResponse(
  //           error: e.toString(), status: response.statusCode);
  //     }
  //   } else if (response.statusCode == 422) {
  //     var jsonResponse = json.decode(response.body);
  //     return ScheduleResponse(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   } else {
  //     var jsonResponse = json.decode(response.body);
  //     return ScheduleResponse(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   }
  // }

  // // Call API to get Amount
  // Future<AmountApiResponse> getAmountApi() async {
  //   String token = await SharedPre.getStringValue(SharedPre.LOGIN_TOKEN);
  //   bool internet = await AppUtil.checkNetwork();
  //   if (!internet) {
  //     return AmountApiResponse(error: Constants.noInternet, status: 501);
  //   }
  //   Response response = await _apiClient.getMethod(
  //     _apiMethods.getAmount,
  //     headers: token != null && token.isNotEmpty
  //         ? {"Authorization": "Bearer $token"}
  //         : null,
  //   );

  //   if (response.statusCode == 200) {
  //     try {
  //       if (response.body.contains('error')) {
  //         var jsonResponse = json.decode(response.body);
  //         return AmountApiResponse(
  //             error: jsonResponse['error']['message'], status: 500);
  //       } else {
  //         AmountApiResponse resp = amountApiResponseFromJson(response.body);
  //         resp.status = response.statusCode;
  //         return resp;
  //       }
  //     } catch (e) {
  //       return AmountApiResponse(
  //           error: e.toString(), status: response.statusCode);
  //     }
  //   } else if (response.statusCode == 422) {
  //     var jsonResponse = json.decode(response.body);
  //     return AmountApiResponse(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   } else {
  //     var jsonResponse = json.decode(response.body);
  //     return AmountApiResponse(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   }
  // }

  // //Get Create investment profile  API
  // Future<CreateWaitlistProfileModel> createInvestmentProfile(var body) async {
  //   String token = await SharedPre.getStringValue(SharedPre.LOGIN_TOKEN);
  //   bool internet = await AppUtil.checkNetwork();
  //   if (!internet) {
  //     return CreateWaitlistProfileModel(
  //         error: Constants.noInternet, status: 501);
  //   }
  //   Response response = await _apiClient.postMethod(
  //     _apiMethods.createInvestmentProfile,
  //     body,
  //     header: token != null && token.isNotEmpty
  //         ? {"Authorization": "Bearer $token"}
  //         : null,
  //   );

  //   if (response.statusCode == 200) {
  //     try {
  //       if (response.body.contains('error')) {
  //         var jsonResponse = json.decode(response.body);
  //         return CreateWaitlistProfileModel(
  //             error: jsonResponse['error']['message'], status: 500);
  //       } else {
  //         CreateWaitlistProfileModel resp =
  //             createWaitlistProfileModelFromJson(response.body);
  //         resp.status = response.statusCode;
  //         return resp;
  //       }
  //     } catch (e) {
  //       return CreateWaitlistProfileModel(
  //           error: e.toString(), status: response.statusCode);
  //     }
  //   } else if (response.statusCode == 422) {
  //     var jsonResponse = json.decode(response.body);
  //     return CreateWaitlistProfileModel(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   } else {
  //     var jsonResponse = json.decode(response.body);
  //     return CreateWaitlistProfileModel(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   }
  // }

  // //Get user profile API
  // Future<UserProfileResponse> getUserProfile() async {
  //   String token = await SharedPre.getStringValue(SharedPre.LOGIN_TOKEN);
  //   bool internet = await AppUtil.checkNetwork();
  //   if (!internet) {
  //     return UserProfileResponse(error: Constants.noInternet, status: 501);
  //   }
  //   Response response = await _apiClient.getMethod(
  //     _apiMethods.getUserProfile,
  //     headers: token != null && token.isNotEmpty
  //         ? {"Authorization": "Bearer $token"}
  //         : null,
  //   );

  //   if (response.statusCode == 200) {
  //     try {
  //       if (response.body.contains('error')) {
  //         var jsonResponse = json.decode(response.body);
  //         return UserProfileResponse(
  //             error: jsonResponse['error']['message'], status: 500);
  //       } else {
  //         UserProfileResponse resp = userProfileResponseFromJson(response.body);
  //         resp.status = response.statusCode;
  //         return resp;
  //       }
  //     } catch (e) {
  //       return UserProfileResponse(
  //           error: e.toString(), status: response.statusCode);
  //     }
  //   } else if (response.statusCode == 422) {
  //     var jsonResponse = json.decode(response.body);
  //     return UserProfileResponse(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   } else {
  //     var jsonResponse = json.decode(response.body);
  //     return UserProfileResponse(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   }
  // }
}
