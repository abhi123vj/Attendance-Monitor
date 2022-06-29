import 'dart:convert';
import 'dart:developer';

import 'package:attendance_montior/constants/app_colors.dart';

import 'package:attendance_montior/models/base_response.dart';

import 'package:attendance_montior/models/login_response.dart';

import 'package:attendance_montior/models/signup_response.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../app_urls.dart';
import '../dio.dart';

class AuthRepo {
  static Future userSignUp({required Map params}) async {
    try {
      final Response response = await dio.post(ApiUrl.signUp, data: params);
      log("Errrorsssssss $response");
      if (response.isSuccess()) {
        log("Sucess ${response.data}");
        final loginres = signUpResponseFromJson(response.data);
        return loginres;
      } else {
        log("Failed $response");
        final loginres = baseResponseFromJson(response.data);
        return loginres;
      }
    } catch (error) {
      log("Errror $error");
      final errorRess = BaseResponse(success: false, message: error.toString());
      return errorRess;
    }
  }

  static Future userLogin({required Map params}) async {
    try {
      final Response response = await dio.post(ApiUrl.signIn, data: params);
      log(response.data.toString());
      if (response.isSuccess()) {
        final loginres = loginResponseFromJson(response.data);
        return loginres;
      } else {
        final loginres = baseResponseFromJson(response.data);
        return loginres;
      }
    } catch (error) {
      final errorRess = BaseResponse(success: false, message: error.toString());
      return errorRess;
    }
  }
}