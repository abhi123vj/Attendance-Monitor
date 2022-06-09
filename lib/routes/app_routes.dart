import 'package:attendance_montior/screens/home_screen.dart';
import 'package:attendance_montior/screens/mark_attendance_screen.dart';
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
  ];
}
