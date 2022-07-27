import 'dart:developer';

import 'package:attendance_montior/models/student_list_res.dart';
import 'package:dio/dio.dart';

import '../../models/attendence_model.dart';
import '../../models/base_res.dart';
import '../app_urls.dart';
import '../dio.dart';

class AttendenceRepo {
    static Future getStudentList({required Map params}) async {
    try {
      final Response response = await dio.post(ApiUrl.studentList, data: params);
      if (response.isSuccess()) {
        final studentList = studentListResponseModelFromJson(response.data);
        return studentList;
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
      static Future markAttnc({required Map params}) async {
    try {
      final Response response = await dio.post(ApiUrl.markAttnd, data: params);
     
        final attdncResponse = baseResponseFromJson(response.data);
        return attdncResponse;
      
    } catch (error) {
      log("Error home repo -> $error");
      final errorRess = BaseResponse(success: false, message: error.toString());
      return errorRess;
    }
  }
      static Future getAttendence({required Map params}) async {
    try {
      final Response response = await dio.post(ApiUrl.viewAttendnce, data: params);
      if (response.isSuccess()) {
        final attndnceDetails = attendenceResponseModelFromJson(response.data);
        return attndnceDetails;
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

}
