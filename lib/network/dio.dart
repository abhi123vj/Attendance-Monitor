import 'dart:convert';
import 'dart:io';

import 'package:attendance_montior/config/app_congif.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  Dio dio = Dio();

  // static Map<String, dynamic> get headers {
  //   return {
  //     'bearer': 'Bearer ${UserSession().accessToken}',
  //     HttpHeaders.acceptHeader: 'application/json',
  //   };
  // }

  // static Options get options {
  //   return Options(
  //     followRedirects: true,
  //     headers: headers
  //   );
  // }

  DioHelper(String baseUrl) {
    dio.options.baseUrl = baseUrl;
    dio.options.followRedirects = true;
    dio.options.headers = {
      // 'bearer': 'Bearer ${UserSession().accessToken}',
      HttpHeaders.acceptHeader: 'application/json',
      //  HttpHeaders.authorizationHeader: 'Bearer ${UserSession().accessToken}'
     
    };
    dio.transformer = JsonTransformer();
    

    // auth interceptor
    _setupAuthInterceptor();
  }

  void _setupAuthInterceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) async {
       
        return handler.next(options);
      }, onError: (DioError error, ErrorInterceptorHandler handler) {
      
        if (error.type == DioErrorType.response) {
          switch (error.response?.statusCode) {
            case 401:
              break;
            case 403:
              // Forbidden
              break;
            case 404:
              break;
            case 500:
              // Server broken
              break;
          }
        } else if (error.type == DioErrorType.other) {
          // Check internet connection
        } else {
          // Show error message
        }
        handler.resolve(Response(
          requestOptions: error.requestOptions,
          data: {'error': error.message},
          statusCode: error.response?.statusCode,
        ));
      }),
    );
  }
}

class JsonTransformer extends DefaultTransformer {
  JsonTransformer() : super(jsonDecodeCallback: _parseJson);
}

Map<String, dynamic> _parseJsonDecode(String response) {
  return jsonDecode(response) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> _parseJson(String text) {
  return compute(_parseJsonDecode, text);
}

final Dio dio = DioHelper(Config.baseUrl).dio;

extension ResponseHelper on Response {
  bool isSuccess() {
    return statusCode == 200;
  }
}
