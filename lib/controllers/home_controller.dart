import 'dart:developer';

import 'package:attendance_montior/models/login_res.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  RxString greetingMes = "".obs;
  List animationList = [
    ['PopOutRightidle', 'PopOutRightIn'],
    ['PopOutBot'],
    ['PopOutRightIn'],
    ['PopOutRightidle'],
  ];
  User? currentuser;
  @override
  void onInit() {
    greetingMes.value = greetingMessage();
    currentuser = Get.arguments;
    super.onInit();
  }

  String greetingMessage() {
    var timeNow = DateTime.now().hour;

    if (timeNow < 12) {
      return 'Good Morning';
    } else if ((timeNow >= 12) && (timeNow <= 16)) {
      return 'Good Afternoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }
}
