import 'dart:developer';

import 'package:attendance_montior/config/user_timetable.dart';
import 'package:attendance_montior/models/login_res.dart';
import 'package:attendance_montior/models/timetable_model.dart';
import 'package:attendance_montior/network/repo/home_repo.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../config/user_session.dart';
import '../models/base_res.dart';

class UpcomingClasss {
  UpcomingClasss({
    this.startTime,
    this.endTime,
    this.semester,
    this.branch,
    this.subjectName,
  });

  String? startTime;
  String? subjectName;
  String? endTime;
  String? semester;
  String? branch;
}

class HomeController extends GetxController {
  RxString greetingMes = "".obs;
  String? userName = "";
  RxBool isAppbarLoading = false.obs;
  List animationList = [
    ['PopOutRightidle', 'PopOutRightIn'],
    ['PopOutBot'],
    ['PopOutRightIn'],
    ['PopOutRightidle'],
  ];
  Rx<UpcomingClasss> nextClasss = UpcomingClasss().obs;
  User? currentuser;
  @override
  void onInit() {
    inintFunction();
    getUserName();
    getNextClass();
    super.onInit();
  }

  inintFunction() {
    getTimeTable();
    greetingMes.value = greetingMessage();
  }

  getTimeTable() async {
    if (UserSession().user?.id != null) {
      Map params = {"teacherId": UserSession().user!.id.toString()};
      var res = await HomeRepo.getTimeTable(params: params);
      if (res.success == true) {
        res as TimeTable;
        if (res.timetable != null) {
          UserTimeTable().saveUserTimetable(res.timetable!);
           Get.snackbar("Data Refreshed","All data has been synced");
          getNextClass();
        }
      } else {
        res as BaseResponse;
        Get.snackbar("TimeTable Fetch Failed", res.message.toString());
        log("Receds fail  ${res.message}");
      }
      log(res.toString());
    }
  }

  getNextClass() {
    DateTime date = DateTime.now();
    switch (date.weekday) {
      case 1:
        findTheHour(UserTimeTable().timetable?.monday, date);
        break;
      case 2:
        findTheHour(UserTimeTable().timetable?.tuesday, date);
        break;
      case 3:
        findTheHour(UserTimeTable().timetable?.wednesday, date);
        break;
      case 4:
        findTheHour(UserTimeTable().timetable?.thursday, date);
        break;
      case 5:
        findTheHour(UserTimeTable().timetable?.friday, date);
        break;
      default:
    }
  }

//monday = Current day
  TimeOfDay stringToTimeOfDay(String tod) {
    final format = DateFormat.jm(); //"6:00 AM"
    return TimeOfDay.fromDateTime(format.parse(tod));
  }

  findTheHour(List<Sday>? monday, DateTime date) {
    
    if (monday != null && monday.isNotEmpty) {
      monday.sort((a, b) {
        if (stringToTimeOfDay(a.startTime).hour <
            stringToTimeOfDay(b.startTime).hour) {
          return -1;
        }
        if (stringToTimeOfDay(a.startTime).hour >
            stringToTimeOfDay(b.startTime).hour) {
          return 1;
        }
        if (stringToTimeOfDay(a.startTime).minute <
            stringToTimeOfDay(b.startTime).minute) {
          return -1;
        }
        if (stringToTimeOfDay(a.startTime).minute >
            stringToTimeOfDay(b.startTime).minute) {
          return 1;
        }
        return 0;
      });
      int flag = -1;
      for (int i = 0; i < monday.length; i++) {
        if (stringToTimeOfDay(monday[i].startTime).hour == date.hour) {
          if (stringToTimeOfDay(monday[i].startTime).minute + 15 >=
              date.minute - 15) {
            flag = i;
            break;
          }
        }
        if (stringToTimeOfDay(monday[i].startTime).hour > date.hour) {
          flag = i;

          break;
        }
      }
      if (flag == -1) {
        nextClasss.value.subjectName = null;
      } else {
        nextClasss.value.subjectName = monday[flag].subjectName;
        nextClasss.value.startTime = monday[flag].startTime;
        nextClasss.value.endTime = monday[flag].endTime;
        nextClasss.value.semester = monday[flag].semester;
        nextClasss.value.branch = monday[flag].branch;
      }
      isAppbarLoading.value = false;
      
      update();
      
    }
  }

  getUserName() {
    userName = UserSession().user?.name;
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
