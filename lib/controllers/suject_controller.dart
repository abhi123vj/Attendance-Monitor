import 'dart:developer';

import 'package:attendance_montior/config/user_session.dart';
import 'package:attendance_montior/models/syllabus_res.dart';
import 'package:attendance_montior/network/repo/home_repo.dart';
import 'package:get/get.dart';

import '../models/base_res.dart';
import '../models/notification_model.dart';

class SubjectController extends GetxController {
  RxList syllabusList = <SyllabusElement>[].obs;
    RxList notificationList = <NotificationElement>[].obs;

  RxString searchKey = "".obs;
  RxBool isloading = false.obs;
  // @override
  // void onInit() {
   

  //   super.onInit();
  // }

  getSujects() async {
    isloading.value = true;
    Map params = {"key": searchKey.value};
    var res = await HomeRepo.getSyllabus(params: params);

    if (res.success == true) {
      res as Syllabus;
      if (res.syllabus != null) {
        syllabusList.clear();
        log(res.syllabus!.length.toString());
        
        syllabusList.addAll(res.syllabus!.toList());
      }
    } else {
      res as BaseResponse;
      Get.snackbar("TimeTable Fetch Failed", res.message.toString());
      log("Receds fail  ${res.message}");
    }
    isloading.value = false;
  }
    getNotification() async {
    isloading.value = true;
    Map params = {
      "teacherId":UserSession().user?.id,
      "key": searchKey.value
      };
    var res = await HomeRepo.getNotification(params: params);

    if (res.success == true) {
      res as Notification;
      if (res.notification != null) {
        notificationList.clear();
        log(res.notification!.length.toString());
        
        notificationList.addAll(res.notification!.toList());
      }
    } else {
      res as BaseResponse;
      Get.snackbar("Notification Fetch Failed", res.message.toString());
      log("Receds fail  ${res.message}");
    }
    isloading.value = false;
  }
}
