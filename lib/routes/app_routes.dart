import 'package:attendance_montior/screens/attendce_detial.dart';
import 'package:attendance_montior/screens/attendece_view_screen.dart';
import 'package:attendance_montior/screens/home_screen.dart';
import 'package:attendance_montior/screens/login.dart';
import 'package:attendance_montior/screens/mark_attendance_screen.dart';
import 'package:attendance_montior/screens/signup_screen.dart';
import 'package:attendance_montior/screens/syllabus_screen.dart';
import 'package:attendance_montior/screens/time_table_screen.dart';
import 'package:attendance_montior/screens/time_table_upload_screen.dart';
import 'package:attendance_montior/screens/login.dart';
import 'package:attendance_montior/screens/mark_attendance_screen.dart';
import 'package:attendance_montior/screens/signup.dart';
import 'package:attendance_montior/screens/splash_screen.dart';
import 'package:attendance_montior/screens/upload_screen.dart';
import 'package:get/get.dart';

import '../screens/splash_screen.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/mark',
      page: () => MarkAttendanceScreen(),
    ),
    GetPage(
      name: '/..',
      page: () => HomeScreen(),
    ),
    GetPage(
      name: '/',
      page: () => AttendenceReview(),
    ),
     GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
      GetPage(
      name: '/syllabus',
      page: () => SyllabusScreen(),
    ),
    //   GetPage(
    //   name: '/signup',
    //   page: () => SignUpScreen(),
    // ),
     GetPage(
      name: '/tymtable',
      page: () => TimeTableScreen(),
    ),
      GetPage(
      name: '/tymtablecreate',
      page: () => TimetableCreateScreen(),
    ),
    GetPage(
      name: '/....',
      page: () => SplashScreen(),
    ),
  ];
}
