import 'dart:developer';

import 'package:attendance_montior/config/data_storage.dart';
import 'package:attendance_montior/models/timetable_model.dart';

class UserTimeTable {
  Timetable? timetable;

  static final UserTimeTable _instance = UserTimeTable._internal();

  factory UserTimeTable() {
    return _instance;
  }

  UserTimeTable._internal() {
    // Initialization
    initUserTimetable();
  }

  Future initUserTimetable() async {
    await getUserTimetable();
  }

  // To Save user details in shared preference
  void saveUserTimetable(Timetable userTimeTable) {
    timetable = userTimeTable;
    final usertimetableMap = userTimeTable.toJson();
    DataManager().putJsonObject(PreferenceKeys.userTimeTable, usertimetableMap);
    log("Time table saved");
  }

  // To get user from the shared preference
  Future getUserTimetable() async {
    final userTimetableMap =
        await DataManager().getJsonObject(PreferenceKeys.userTimeTable);
   
    if (userTimetableMap.isNotEmpty) {
      timetable = Timetable.fromJson(userTimetableMap);
    }
  }

  // To clear user session
  Future clearSession() async {
    timetable = null;
    await DataManager().removeObject(PreferenceKeys.userTimeTable);
  }
}
