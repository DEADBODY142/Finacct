import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:collector_app/common/http/custom_exception.dart';
// import 'package:collector_app/common/http/dio_client.dart';
// import 'package:collector_app/common/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:finacct/common/http/custom_exception.dart';
import 'package:finacct/common/http/dio_client.dart';
import 'package:finacct/common/shared_pref.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart' as parse;
import 'package:mime/mime.dart';

class ApiProvider {
  final String baseUrl;

  ApiProvider({
    required this.baseUrl,
  });


  Future<Map<String, dynamic>> post(
    String url,
    dynamic body, {
    String token = '',
    bool isRefreshRequest = false,
    Map<String, String> header = const {},
  }) async {
    dynamic responseJson;
    final DioClient dioClient = DioClient(baseUrl: baseUrl);

    try {
      final Map<String, String> requestHeader = {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'origin': '*',
        ...header,
        // // ...await DeviceUtils.deviceInfoHeader,
      };

      if (token.isNotEmpty) {
        requestHeader['Authorization'] = 'Bearer $token';
      }
      final dynamic response = await dioClient.post(
        Uri.parse(url),
        data: body,
        options: Options(headers: requestHeader),
      );
      responseJson = _response(response, url);
    } on DioException catch (e) {
      responseJson = await _handleErrorResponse(e);
      print("this is error response ${e.response}");
      await SharedPref.setInvalidResponse(e.response.toString());
    }
    return responseJson;
  }

  Future<dynamic> patch(
    String url,
    dynamic body, {
    required int? userId,
    String token = '',
    bool isRefreshRequest = false,
  }) async {
    final DioClient dioClient = DioClient(
      baseUrl: baseUrl,
    );

    dynamic responseJson;
    try {
      final Map<String, String> header = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
        // // ...await DeviceUtils.deviceInfoHeader,
      };
      if (token.isNotEmpty) {
        header['Authorization'] = 'Bearer $token';
      }
      final dynamic response = await dioClient.patch(
        Uri.parse(url),
        data: body,
        options: Options(headers: header),
      );
      responseJson = _response(response, url);
    } on DioException catch (e) {
      responseJson = await _handleErrorResponse(e);
    }
    return responseJson;
  }

  Future<dynamic> put(
    String url,
    dynamic body, {
    required int? userId,
    String token = '',
    bool isRefreshRequest = false,
  }) async {
    final DioClient dioClient = DioClient(
      baseUrl: baseUrl,
    );

    dynamic responseJson;
    try {
      final Map<String, String> header = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
        // ...await DeviceUtils.deviceInfoHeader,
      };
      if (token.isNotEmpty) {
        header['Authorization'] = 'Bearer $token';
      }
      final dynamic response = await dioClient.put(
        Uri.parse(url),
        data: body,
        options: Options(headers: header),
      );
      responseJson = _response(response, url);
    } on DioException catch (e) {
      responseJson = await _handleErrorResponse(e);
    }
    return responseJson;
  }

  Future<dynamic> get(
    Uri url, {
    required int? userId,
    String token = '',
    bool isRefreshRequest = false,
    int timeOut = 30,
    Map<String, dynamic>? extraHeaders,
  }) async {
    final DioClient dioClient = DioClient(
      baseUrl: baseUrl,
    );

    dynamic responseJson;

    try {
      final Map<String, String> header = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
        'Access-Control-Allow-Origin': '*',
        ...extraHeaders ?? {},
        // // ...await DeviceUtils.deviceInfoHeader,
      };

      if (token.isNotEmpty) {
        header['Authorization'] = 'Bearer $token';
      }
      final dynamic response = await dioClient.get(
        url,
        options: Options(
          headers: header,
          // sendTimeout: timeOut * 1000,
          // receiveTimeout: timeOut * 1000,
          sendTimeout: Duration(seconds: timeOut),
          receiveTimeout: Duration(seconds: timeOut),
        ),
      );

      responseJson = _response(response, url.toString(), cacheResult: true);
    } on DioException catch (e, s) {
      responseJson = await _handleErrorResponse(e);
      // Log.e(e);
      // Log.d(s);
    }
    return responseJson;
  }

  Future<dynamic> delete(String url,
      {required int? userId, String token = '', dynamic body}) async {
    final DioClient dio = DioClient(
      baseUrl: baseUrl,
    );
    dynamic responseJson;
    try {
      final Map<String, String> header = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
        'Access-Control-Allow-Origin': '*',
        // // ...await DeviceUtils.deviceInfoHeader,
      };
      debugPrint('TOKEN $token');
      if (token.isNotEmpty) {
        header['Authorization'] = 'Bearer $token';
      }
      final dynamic response = await dio.delete(Uri.parse(url),
          data: body, options: Options(headers: header));
      responseJson = await _response(response, url);
      responseJson['status'] = response.statusCode;
    } on DioException catch (e) {
      responseJson = await _handleErrorResponse(e);
    }
    return responseJson;
  }

  upload(String url, File file,
      {required int? userId, String token = ''}) async {
    final DioClient dio = DioClient(
      baseUrl: baseUrl,
    );
    dynamic responseJson;
    try {
      final Map<String, String> header = {
        'accept': 'application/json',
        'origin': '*',
        'Access-Control-Allow-Origin': '*',
        // ...await DeviceUtils.deviceInfoHeader,
      };
      if (token.isNotEmpty) {
        header['Authorization'] = 'Bearer $token';
      }
      final String fileName = file.path.split('/').last;
      // final String _extention = file.path.split('.').last;
      // ignore: unused_local_variable
      final String type = lookupMimeType(file.path)!.split('/').first;

      final FormData formData = FormData.fromMap(<String, dynamic>{
        'image': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: parse.MediaType('image', file.path.split('.').last),
        ),
      });
      final Response<dynamic> response = await dio.post(
        Uri.parse(url),
        data: formData,
        options: Options(headers: header),
        onSendProgress: (count, total) {},
      );

      responseJson = _response(response, url);
    } on DioException catch (e) {
      responseJson = await _handleErrorResponse(e);
      // Log.e(e);
    }
    return responseJson;
  }

  uploadToAWS(
    String url,
    File file,
    String filename, {
    required int? userId,
    String token = '',
    required Function(int, int) onSendProgress,
  }) async {
    final DioClient dio = DioClient(
      baseUrl: baseUrl,
    );
    dynamic responseJson;
    try {
      // ignore: unused_local_variable
      final Map<String, String> header = {
        'accept': 'application/json',
        'origin': '*',
        "content-type": "video/quicktime",
        'content-length': (await file.length()).toString(),
      };

      final String type = lookupMimeType(file.path)!.split('/').first;
      print(type);

      // ignore: unused_local_variable
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'file': await MultipartFile.fromFile(
          file.path,
          filename: filename,
          contentType: parse.MediaType('video', file.path.split('.').last),
        ),
      });

      final Response<dynamic> response = await dio.put(
        Uri.parse(url),
        data: file.openRead(),
        options: Options(headers: {
          Headers.contentLengthHeader: await file.length(),
          Headers.contentTypeHeader:
              parse.MediaType('video', file.path.split('.').last).toString(),
        }),
        onSendProgress: (count, total) {
          print(count / total);
          onSendProgress(count, total);
        },
      );

      responseJson = _response(response, url);
    } on DioException catch (e) {
      responseJson = await _handleErrorResponse(e);
      // Log.e(e);
    }
    return responseJson;
  }

  Future<File?> download(String url, String localPath,
      {required int userId, required String token}) async {
    final DioClient dio = DioClient(
      baseUrl: baseUrl,
    );
    try {
      final Map<String, String> header = {
        'accept': 'application/json',
        'origin': '*',
        // ...await DeviceUtils.deviceInfoHeader,
      };

      if (token.isNotEmpty) {
        header['Authorization'] = 'Bearer $token';
      }

      final Response<dynamic> response = await dio.get(
        Uri.parse(url),
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          headers: header,
          validateStatus: (status) {
            if (status == null) {
              return false;
            }
            return status < 500;
          },
        ),
      );
      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          final File file = File(localPath);
          final raf = file.openSync(mode: FileMode.write);
          raf.writeFromSync(response.data);
          await raf.close();
          return file;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } on DioException catch (e) {
      // Log.e(e);

      return null;
    } catch (e) {
      // Log.e("Error in downlodng");
      return null;
    }
  }

  _handleErrorResponse(DioException e) async {
    if (e.toString().toLowerCase().contains("socketexception")) {
      throw NoInternetException('No Internet connection', 1000);
    } else {
      if (e.response != null) {
        return await _response(e.response!, "");
      } else {
        throw FetchDataException(
          'An error occurred while fetching data.',
          e.response?.statusCode,
        );
      }
    }
  }

  Future<Map<String, dynamic>> _response(Response response, String url,
      {bool cacheResult = false}) async {
    final Map<String, dynamic> res = response.data is Map
        ? response.data
        : (response.data is List)
            ? {"data": response.data}
            : {};

    final responseJson = <String, dynamic>{};
    responseJson['data'] = res;

    responseJson['statusCode'] = response.statusCode;
    switch (response.statusCode) {
      case 200:
        if (cacheResult) {
          try {
            // await SharedPref.setRestApiData(url, json.encode(res));
          } catch (e) {
            print(e);
          }
        }

        return responseJson;
      case 204:
        return responseJson;
      case 201:
        return responseJson;
      case 400:
        final String responseStatus =
            (responseJson['data']?['status'] ?? "").toString();

        if (responseStatus.toLowerCase() == "FAILURE".toLowerCase()) {
          throw BadRequestException(
            responseJson['data']?['message'] ?? "",
            response.statusCode,
          );
        } else {
          return responseJson;
        }
      case 405:
        return responseJson;
      case 404:
        throw ResourceNotFoundException(
            getErrorMessage(res, 404), response.statusCode);
      case 409:
        return responseJson;
      case 422:
        responseJson['error'] = getErrorMessage(res, response.statusCode);
        throw BadRequestException(
            getErrorMessage(res, 404), response.statusCode);
      case 429:
        responseJson['error'] = getErrorMessage(res, response.statusCode);
        throw BadRequestException(
            "You've made too many requests. Please try again after a while.",
            response.statusCode);
      case 401:
      case 403:
        // if (responseJson['data']?['error_description'] != null) {
        //   throw BadRequestException(
        //     responseJson['data']?['error_description'] ?? "",
        //     response.statusCode,
        //   );
        // }
        // TODOCheck status from Response and Logout only when session is expire
        final String responseCode =
            (responseJson['data']?['code'] ?? "").toString();
        final String responseStatus =
            (responseJson['data']?['responseStatus'] ?? "").toString();

        if (responseCode == "M0025" ||
            responseCode == "M0005" ||
            responseCode == "M0007" ||
            responseStatus == "UNAUTHORIZED_USER") {
          throw BadRequestException(
            responseJson['data']?['message'] ?? "",
            response.statusCode,
          );
        } else {
          // await SharedPref.removeBiometricLogin();
          // RepositoryProvider.of<UserRepository>(NavigationService.context)
          //     .logout(isSessionExpired: true);
          throw UnauthorisedException(
              getErrorMessage(res, 401), response.statusCode);
        }

      // RepositoryProvider.of<UserRepository>(NavigationService.context)
      //     .logout(isSessionExpired: true);
      // throw UnauthorisedException(
      //     getErrorMessage(res, 401), response.statusCode);
      case 417:
        return responseJson;
      case 500:
        throw InternalServerErrorException(
            getErrorMessage(res, 404), response.statusCode);

      // This is PayWell Specific Custom Server Exception with any specific message on Gateway level blockage.
      case 506:
        throw CustomServerException(
            jsonDecode(response.data)['message'] ??
                "Feature not available. Please check back again.",
            response.statusCode);
      case 420:
        throw CustomServerException(
            getErrorMessage(res, 404), response.statusCode);
      default:
        throw NoInternetException(
            'Error occured while Communication with Server',
            response.statusCode);
    }
  }

  String getErrorMessage(dynamic res, [int? statusCode]) {
    String message = "";
    try {
      print(res);
      debugPrint("-------------------GET ERROR ------------------");
      if (res["data"] is Map) {
        if (res["data"]?["message"] is String &&
            (res["data"]?["message"] ?? "").toString().isNotEmpty) {
          message = res["data"]?["message"];
          return message;
        }
      }
      if (res["message"] is String) {
        message = res["message"];
        return message;
      }
      if (res["message"] is List) {
        final List<dynamic> messages = res['message'][0]["messages"];
        for (var element in messages) {
          message += (element as Map<String, dynamic>)['message'] + '\n';
        }
        return message;
      }
      if (res["data"] is String) {
        message = res["data"] ?? "";
      }
    } catch (e) {
      return message.isEmpty
          ? _getErroMessageAccordingtoStatusCode(statusCode)
          : message;
    }
    return message.isEmpty
        ? _getErroMessageAccordingtoStatusCode(statusCode)
        : message;
  }

  String _getErroMessageAccordingtoStatusCode(int? statusCode) {
    if (statusCode == 400) {
      return "Bad Request";
    } else if (statusCode == 404) {
      return "Resource Not Found";
    } else if (statusCode == 422) {
      return "Bad Request";
    } else if (statusCode == 403 || statusCode == 402 || statusCode == 401) {
      return "Unauthorized";
    } else if (statusCode == 500) {
      return "Internal Server Error";
    } else {
      return "Something went wrong";
    }
  }
}
