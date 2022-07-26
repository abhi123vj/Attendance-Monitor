import 'dart:developer';

import 'package:attendance_montior/models/notification_model.dart';
import 'package:attendance_montior/models/syllabus_res.dart';
import 'package:attendance_montior/models/timetable_model.dart';
import 'package:dio/dio.dart';

import '../../models/base_res.dart';
import '../app_urls.dart';
import '../dio.dart';

class HomeRepo {
  static Future getTimeTable({required Map params}) async {
    try {
      final Response response = await dio.post(ApiUrl.timeTable, data: params);
      if (response.isSuccess()) {
        final timetableResponse = timeTableFromJson(response.data);
        return timetableResponse;
      } else {
        final timetableResponse = baseResponseFromJson(response.data);
        return timetableResponse;
      }
    } catch (error) {
      log("Error home repo -> $error");
      final errorRess = BaseResponse(success: false, message: error.toString());
      return errorRess;
    }
  }

  static Future getSyllabus({required Map params}) async {
    try {
      final Response response = await dio.post(
        ApiUrl.syllabus, data: params
      );
      if (response.isSuccess()) {
        final syllabusResponse = syllabusFromJson(response.data);
        return syllabusResponse;
      } else {
        final syllabusResponse = baseResponseFromJson(response.data);
        return syllabusResponse;
      }
    } catch (error) {
      log("Error home repo -> $error");
      final errorRess = BaseResponse(success: false, message: error.toString());
      return errorRess;
    }
  }
    static Future getNotification({required Map params}) async {
    try {
      final Response response = await dio.post(
        ApiUrl.notify, data: params
      );
      if (response.isSuccess()) {
        final notificationResponse = notificationFromJson(response.data);
        return notificationResponse;
      } else {
        final notificationResponse = baseResponseFromJson(response.data);
        return notificationResponse;
      }
    } catch (error) {
      log("Error home repo -> $error");
      final errorRess = BaseResponse(success: false, message: error.toString());
      return errorRess;
    }
  }
}
