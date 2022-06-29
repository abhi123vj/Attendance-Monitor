import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:attendance_montior/config/app_congif.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';

import '../config/user_session.dart';

class DioHelper {
  Dio dio = Dio();
  DioHelper(String baseUrl) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.options.followRedirects = true;
    dio.options.headers = {
      // 'bearer': 'Bearer ${UserSession().accessToken}',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: UserSession().accessToken
      //  HttpHeaders.authorizationHeader: 'Bearer ${UserSession().accessToken}'
    };
    dio.transformer = JsonTransformer();

    // auth interceptor
    _setupAuthInterceptor();
  }

  void _setupAuthInterceptor() {
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print, // specify log function (optional)
        retries: 3, // retry count (optional)
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
        if (options.headers['authorization'] == '' ||
            options.headers['authorization'] == null) {
          log("Empty token fetching token");
          await UserSession().getTokens();
          if (UserSession().accessToken != '' ||
              UserSession().accessToken.isNotEmpty) {
            options.headers['authorization'] = UserSession().accessToken;
          }
        }

        log(options.headers.toString());

        return handler.next(options);
      }, 
      onResponse: (options, handler) async {
        log("response was ${options.data}");
         return handler.next(options);
      },
      onError: (DioError error, ErrorInterceptorHandler handler) {
        if (error.type == DioErrorType.response) {
          switch (error.response?.statusCode) {
            case 401:
             handler.resolve(Response(
            requestOptions: error.requestOptions,
            data: {
              'success': error.response?.data["success"],
              'message': error.response?.data["message"],
              'errorMessage': error.message
            },
            statusCode: error.response?.statusCode,
          ));
              break;
            case 403:
             handler.resolve(Response(
            requestOptions: error.requestOptions,
            data: {
              'success': error.response?.data["success"],
              'message': error.response?.data["message"],
              'errorMessage': error.message
            },
            statusCode: error.response?.statusCode,
          ));
              // Forbidden
              break;
            case 404:
             handler.resolve(Response(
            requestOptions: error.requestOptions,
            data: {
              'success': error.response?.data["success"],
              'message': error.response?.data["message"],
              'errorMessage': error.message
            },
            statusCode: error.response?.statusCode,
          ));
              break;
            case 500:
              // Server broken
              handler.resolve(Response(
                requestOptions: error.requestOptions,
                data: {
                  'success': false,
                  'message': error.message,
                  'errorMessage': "errormessage"
                },
                statusCode: error.response?.statusCode,
              ));
              break;
          }
        } else if (error.type == DioErrorType.other) {
          log("Error time ${error.type}");
          handler.resolve(Response(
            requestOptions: error.requestOptions,
            data: {
              'success': false,
              'message': 'Network Error ${error.type}',
              'errorMessage': error.message
            },
            statusCode: error.response?.statusCode,
          ));
        } else if (error.type == DioErrorType.connectTimeout) {
          log("Error connection ${error.type}");

          handler.resolve(Response(
            requestOptions: error.requestOptions,
            data: {
              'success': false,
              'message': 'Network Error ${error.type}',
              'errorMessage': error.message
            },
            statusCode: 500,
          ));
        } else {
          log("Error time 2 ${error.type}");
          handler.resolve(Response(
            requestOptions: error.requestOptions,
            data: {
              'success': false,
              'message': error.message,
              'errorMessage': "errormessage"
            },
            statusCode: error.response?.statusCode,
          ));
          return;
          // Show error message
        }      
         
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
