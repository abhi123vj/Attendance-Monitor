import 'dart:developer';

import 'package:attendance_montior/models/all_user_data.dart';
import 'package:dio/dio.dart';

import '../../models/base_res.dart';
import '../app_urls.dart';
import '../dio.dart';

class HomeRepo {
  static Future alluserDetails() async {
    try {
      final Response response = await dio.get(ApiUrl.allUsers);
      if (response.isSuccess()) {
        AllUserData data = allUserDataFromJson(response.data);
        // log(response.toString());
        return data;
      } else {
        final base = baseResponseFromJson(response.data);
        return base;
      }
    } catch (error) {
      final errorRess = BaseResponse(success: false, message: error.toString());
      return errorRess;
    }
  }

  static Future verifyUser(Map params) async {
    try {
      final Response response = await dio.post(ApiUrl.verifyUser, data:params);
      log(response.toString());
      final base = baseResponseFromJson(response.data);
      return base;
      
    } catch (error) {
      final errorRess = BaseResponse(success: false, message: error.toString());
      return errorRess;
    }
  }
}
