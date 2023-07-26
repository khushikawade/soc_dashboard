import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:http_parser/http_parser.dart';

@lazySingleton
class ApiClient {
  static const String BASE_URL = 'https://mm-api.zehntech.net/api/v1/';

  Future<http.Response> getMethod(String url,
      {Map<String, String>? headers}) async {
    http.Response response =
        await http.get(Uri.parse(BASE_URL + url), headers: headers);
    print(response.body.toString());
    return response;
  }

  Future<http.Response> getStaticUrlMethod(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    print(response.body.toString());
    return response;
  }

  Future<http.Response> postMethod(String method, var body,
      {Map<String, String>? header}) async {
    print(body);
    print(BASE_URL + method);
    http.Response response = await http.post(Uri.parse(BASE_URL + method),
        body: body, headers: header);
    return response;
  }

  // Future<Map<String, dynamic>> postMethodRow(String method, var body,
  //     {Map<String, String>? header}) async {
  //   try {
  //     print(body);
  //   print(header);
  //   print(BASE_URL + method);
  //   final  jsonString = json.encode(body);
  //   http.Response response = await http.post(Uri.parse(BASE_URL + method),
  //       body: jsonString, headers: header);

  //   Map<String, dynamic> encodedString = jsonDecode(response.body);
  //   print(encodedString);

  //   return encodedString;
  //   } catch (e) {
  //     throw(e);
  //   }
  // }
  Future<http.Response> postMethodRow(String method, var body,
      {Map<String, String>? header}) async {
    final jsonString = json.encode(body);
    http.Response response = await http.post(Uri.parse(BASE_URL + method),
        body: jsonString, headers: header);

    return response;
  }

  Future<http.Response> patchMethod(
      String method, var body, Map<String, String> headers) async {
    http.Response response = await http.patch(Uri.parse(BASE_URL + method),
        body: body, headers: headers);
    return response;
  }

  Future<http.Response> postMethodMultipart(
    Map<String, String> header,
    String method,
    var body,
    String filePath,
  ) async {
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(BASE_URL + method));
    request.headers.addAll(header);
    request.fields.addAll(body);
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      filePath,
      contentType: MediaType('video', '*'),
    ));
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.body);
    return response;
  }

  Future<http.Response> postMethodPDFMultipart({
    required String fileKey,
    required Map<String, String> header,
    required String method,
    required var body,
    required List<String> filePath,
  }) async {
    print(body);
    print(BASE_URL + method);
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(BASE_URL + method));
    request.headers.addAll(header);
    request.fields.addAll(body);

    if (filePath.isNotEmpty && filePath.isNotEmpty) {
      for (int i = 0; i < filePath.length; i++) {
        request.files.add(await http.MultipartFile.fromPath(
          'attachment[$i][attachment_file]',
          filePath[i],
          contentType: MediaType('application', 'pdf'),
        ));
      }
    }

    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.body);
    return response;
  }

  Future<http.Response> multiPostMethodForSingleFileUpload({
    required String fileKey,
    required Map<String, String> header,
    required String method,
    required var body,
    required String filePath,
  }) async {
    print(body);
    print(BASE_URL + method);
    http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(BASE_URL + method));
    request.headers.addAll(header);
    request.fields.addAll(body);

    if (filePath.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
        fileKey,
        filePath,
        contentType: MediaType('application', 'pdf'),
      ));
    }

    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.body);
    return response;
  }

  Future<http.Response> putMethodMultipart(
    Map<String, String> header,
    String method,
    var body,
    String filePath,
  ) async {
    http.MultipartRequest request =
        http.MultipartRequest('PUT', Uri.parse(BASE_URL + method));
    request.headers.addAll(header);
    request.fields.addAll(body);
    if (filePath.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
        'upload_image',
        filePath,
        contentType: MediaType('image', '*'),
      ));
    }
    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.body);
    return response;
  }
}
