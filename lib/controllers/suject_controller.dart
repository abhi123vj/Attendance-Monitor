import 'dart:developer';

import 'package:attendance_montior/models/syllabus_res.dart';
import 'package:attendance_montior/network/repo/home_repo.dart';
import 'package:get/get.dart';

import '../models/base_res.dart';

class SubjectController extends GetxController {
  RxList syllabusList = <SyllabusElement>[].obs;
  RxString searchKey = "".obs;
  RxBool isloading = false.obs;
  @override
  void onInit() {
    getSujects();

    super.onInit();
  }

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
}
