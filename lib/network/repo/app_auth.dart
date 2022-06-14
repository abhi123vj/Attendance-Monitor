import 'dart:convert';
import 'dart:developer';

import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/models/base_res.dart';
import 'package:attendance_montior/models/login_res.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../app_urls.dart';
import '../dio.dart';

class AuthRepo {
  static Future userSignUp({required Map params}) async {
    try {
      final Response response = await dio.post(ApiUrl.signIn, data: params);
      if (response.isSuccess()) {
        log("Sucess ${response.data['message']}");
        Get.snackbar(response.data['message'], "Sucess",
            colorText: AppColors.cyanNormal);

        return true;
      } else {
        log("Failed $response");
        return false;
      }
    } catch (error) {
      log("Errror $error");
      return false;
    }
  }

  static Future userLogin({required Map params}) async {
    try {
      final Response response = await dio.post(ApiUrl.signIn, data: params);
      if (response.isSuccess()) {      
        final loginres = loginResponseFromJson(response.data);
        return loginres;
      } else {    
         final loginres = baseResponseFromJson(response.data);
        return loginres;
      }
    } catch (error) {
      log("Errror ${error}");
      return false;
    }
  }
}