import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AttendenceController extends GetxController {
  RxList semList = <String>[].obs;
  RxList studentList = [
    {"stName": "Abhiram 1", "stRollNo": 18404036, "stStatus": null}.obs,
    {"stName": "Abhiram 2", "stRollNo": 18404036, "stStatus": null}.obs,
    {"stName": "Abhiram 3", "stRollNo": 18404036, "stStatus": null}.obs
  ].obs;
    RxInt totalStudents = 0.obs;

  RxString semValue = "".obs;

  final TextEditingController semTextEditingController =
      TextEditingController();
  @override
  void onInit() {
    semTextEditingController.addListener(() {
      semValue.value = semTextEditingController.text;
      //fetchStudentLists(semValue.value);
    });
   
    super.onInit();
  }

}
