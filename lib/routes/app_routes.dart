import 'package:attendance_montior/screens/home_screen.dart';
import 'package:attendance_montior/screens/login.dart';
import 'package:attendance_montior/screens/mark_attendance_screen.dart';
import 'package:attendance_montior/screens/signup.dart';
import 'package:attendance_montior/screens/splash_screen.dart';
import 'package:attendance_montior/screens/upload_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: '/mark',
      page: () => MarkAttendanceScreen(),
    ),
  ];
}
