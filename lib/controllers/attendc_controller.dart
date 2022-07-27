import 'dart:developer';

import 'package:attendance_montior/network/repo/attendence_repo.dart';
import 'package:get/get.dart';

import '../config/user_session.dart';
import '../models/attendence_model.dart';
import '../models/base_res.dart';
import '../models/student_list_res.dart';
import '../routes/app_routes.dart';

class AttendenceController extends GetxController {
  RxList subjectList = <String>[].obs;
  RxInt selectedIndex = 0.obs;
  RxBool isloading = false.obs;
  RxList studentList = <StudentsList>[].obs;
  RxInt totalStudents = 0.obs;
  RxBool isAllMarker = false.obs;

  List presentStudents = [];
  RxInt selcetdHourIndex = 1.obs;
  String topics = "";

  RxList dates = <Date>[].obs;
  List totalAttendance = <List>[];
  RxList studentAttendance = <StudentAttendance>[].obs;
  @override
  void onInit() {
    inintFun();
    super.onInit();
  }

  getStudentAttendence() async {
    dates.clear();
    studentAttendance.clear();
    totalAttendance.clear();
    isloading.value = true;
    update();
    Map params = {
      "subjectId":
          UserSession().user?.subjects.elementAt(selectedIndex.value).subjectId
    };

    var res = await AttendenceRepo.getAttendence(params: params);
    if (res.success == true) {
      res as AttendenceResponseModel;
      dates.addAll(res.attendance!.dates.toList());
      studentAttendance.addAll(res.attendance!.studentAttendance.toList());
      for (int i = 0; i < studentAttendance.length; i++) {
        totalAttendance
            .add(findTotalAttendence(studentAttendance[i].attendance));
      }
      // studentList.addAll(res.studentsList.toList());
    } else {
      res as BaseResponse;
      Get.snackbar("Notification Fetch Failed", res.message.toString());
      log("Receds fail  ${res.message}");
    }
    update();
  }

  List findTotalAttendence(String s) {
    List attdnc = [];
    for (int i = 0; i < s.length; i++) {
      var char = s[i];

      int value = int.parse(char);
      attdnc.add(value);
    }
    return attdnc;
  }

  markAttendece() async {
    isloading.value = true;
    Map params = {
      "subjectId":
          UserSession().user?.subjects.elementAt(selectedIndex.value).subjectId,
      "presentStudentList": presentStudents,
      "periodNumber": selcetdHourIndex.value,
      "date": DateTime.now().toString(),
      "notes": topics
    };
    var res = await AttendenceRepo.markAttnc(params: params);
    if (res.success == true) {
      res as BaseResponse;
      Get.snackbar("Sucessfull", res.message.toString());
      Get.offNamed(AppRoutes.homeScreen);
    } else {
      res as BaseResponse;
      Get.snackbar("Notification Fetch Failed", res.message.toString());
      log("Receds fail  ${res.message}");
    }
    isloading.value = false;
  }

  checkMarking() {
    presentStudents.clear();
    for (int i = 0; i < studentList.length; i++) {
      if (studentList.elementAt(i).status == null) {
        isAllMarker.value = false;
        return;
      }
      if (studentList.elementAt(i).status == true) {
        presentStudents.add(studentList.elementAt(i).id);
      }
      isAllMarker.value = true;
    }
  }

  inintFun() {
    getStudentListFor();
  }

  getStudentListFor() async {
    isloading.value = true;
    totalStudents.value = 0;
    Map params = {
      "subjectId":
          UserSession().user?.subjects.elementAt(selectedIndex.value).subjectId,
    };
    var res = await AttendenceRepo.getStudentList(params: params);
    if (res.success == true) {
      res as StudentListResponseModel;
      studentList.clear();

      studentList.addAll(res.studentsList.toList());
    } else {
      res as BaseResponse;
      Get.snackbar("Notification Fetch Failed", res.message.toString());
      log("Receds fail  ${res.message}");
    }
    isloading.value = false;
  }
}
