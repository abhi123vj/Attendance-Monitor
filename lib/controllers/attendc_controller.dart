import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final TextEditingController semTextEditingController =
      TextEditingController();
  @override
  void onInit() {
    semTextEditingController.addListener(() {
      semValue.value = semTextEditingController.text;
      //fetchStudentLists(semValue.value);
    });
    fetchsem();
    super.onInit();
  }

  fetchsem() async {
    try {
      await db.collection("Subjects").get().then((event) {
        for (var doc in event.docs) {
          semList.add(doc.id);

          print("${doc.id} => ${doc.data()}");
        }
      });
    } catch (e) {
      log("Sems error $e");
    }
    log("SThe sem $semList");
  }
}
