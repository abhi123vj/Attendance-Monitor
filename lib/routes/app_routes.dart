import 'package:attendance_montior/screens/attendece_view_screen.dart';
import 'package:attendance_montior/screens/home_screen.dart';
import 'package:attendance_montior/screens/mark_attendance_screen.dart';
import 'package:get/get.dart';

import '../screens/splash_screen.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => AttendenceReview(),
    ),
    GetPage(
      name: '/mark',
      page: () => MarkAttendanceScreen(),
    ),
    GetPage(
      name: '/aview',
      page: () => AttendenceReview(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
    ),
  ];
}
