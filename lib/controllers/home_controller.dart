import 'dart:developer';

import 'package:attendance_montior/constants/user_property.dart';
import 'package:attendance_montior/models/login_res.dart' as dbuser;
import 'package:attendance_montior/models/simple_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../models/all_user_data.dart' as allusers;
import '../models/base_res.dart';
import '../network/repo/app_auth.dart';
import '../network/repo/home_repo.dart';

class HomeController extends GetxController {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  RxString greetingMes = "".obs;
  dbuser.User? currentuser;
  List<SimpleUserModel> techerList = [];
  List<SimpleUserModel> studentList = [];
  Map<String, List<SimpleUserModel>> pendingUser = {};
  RxString activeUser = UserRoles.teacher.obs;
  RxBool isLoading = false.obs;
  changeActiveUSer(String str) {
    activeUser.value = str;
    update();
  }

  @override
  void onInit() {
    greetingMes.value = greetingMessage();
    currentuser = Get.arguments;
    fetchUsers();
    super.onInit();
  }

  updateUserStatus(String email, String status) async {
    isLoading.value = true;
    update();
    var res = await HomeRepo.verifyUser(
        {"email": email, "currentuserStatus": status});
    await fetchUsers();
    res as BaseResponse;
    if (res.success) {
      Get.snackbar("User $status", res.message.toString());
    } else {
      Get.snackbar("Oh No! Error.", res.message.toString());
    }
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

  fetchUsers() async {
    isLoading.value = true;
    update();
    var res = await HomeRepo.alluserDetails();
    if (res.success == true) {
      res as allusers.AllUserData;
      techerList.clear();
      studentList.clear();
      pendingUser.clear();
      for (var user in res.users!) {
        SimpleUserModel tmp = SimpleUserModel(
            user.name ?? "userName",
            user.mobnumber ?? 00,
            user.dept ?? "userDep",
            user.currentuserStatus ?? "userStat",
            user.email ?? "userEmail");
        if (user.currentuserStatus == "Accepted") {
          techerList.add(tmp);
        } else {
          if (pendingUser[UserRoles.teacher] == null) {
            pendingUser[UserRoles.teacher] = [];
          }

          pendingUser[UserRoles.teacher]?.add(tmp);
        }
      }
      for (var user in res.students!) {
        SimpleUserModel tmp = SimpleUserModel(
            user.name ?? "userName",
            user.mobnumber ?? 00,
            user.dept ?? "userDep",
            user.currentuserStatus ?? "userStat",
            user.email ?? "userEmail");
        if (user.currentuserStatus == "Accepted") {
          studentList.add(tmp);
        } else {
          if (pendingUser[UserRoles.student] == null) {
            pendingUser[UserRoles.student] = [];
          }
          pendingUser[UserRoles.student]?.add(tmp);
        }
      }
    } else {
      res as BaseResponse;
      Get.snackbar("Login Failed", res.message.toString());
    }
    isLoading.value = false;
    update();
  }
}
