import 'dart:developer';

import 'package:attendance_montior/config/user_timetable.dart';
import 'package:attendance_montior/models/timetable_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeTableCOntroller extends GetxController {
  RxInt selectedIndex = 2.obs;
  List date = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];
  RxList activeClasses = [].obs;
  @override
  void onInit() {
    findToday();
    //readTimeTable();
    getTimeTable();
    super.onInit();
  }

//? converyter
  TimeOfDay stringToTimeOfDay(String tod) {
    final format = DateFormat.jm(); //"6:00 AM"
    return TimeOfDay.fromDateTime(format.parse(tod));
  }

  readTimeTable() async {
    String s = "06:00 PM";
    String e = "08:00 PM";
  }

  getTimeTablefor(int index) {
    selectedIndex.value = index;
    getTimeTable();
  }

  getTimeTable() {
    if (UserTimeTable().timetable != null) {
      activeClasses.clear();
      switch (selectedIndex.value) {
        case 0:
          activeClasses.addAll(UserTimeTable().timetable?.monday == null
              ? []
              : UserTimeTable().timetable!.monday!.cast());
          break;
        case 1:
          activeClasses.addAll(UserTimeTable().timetable?.tuesday == null
              ? []
              : UserTimeTable().timetable!.tuesday!.cast());
          break;
        case 2:
          activeClasses.addAll(UserTimeTable().timetable?.wednesday == null
              ? []
              : UserTimeTable().timetable!.wednesday!.cast());
          break;
        case 3:
          activeClasses.addAll(UserTimeTable().timetable?.thursday == null
              ? []
              : UserTimeTable().timetable!.thursday!.cast());
          break;
        case 4:
          activeClasses.addAll(UserTimeTable().timetable?.friday == null
              ? []
              : UserTimeTable().timetable!.friday!.cast());
          break;

        default:
      }
      activeClasses.sort((a, b) {
        a as Sday;
        b as Sday;
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
    }
  }

  findToday() {
    String today = DateFormat('EEEE').format(DateTime.now());
    for (int i = 0; i < date.length; i++) {
      if (today == date[i]) {
        selectedIndex.value = i;
        break;
      }
    }
  }
}
