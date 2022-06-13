import 'package:attendance_montior/screens/home_screen.dart';
import 'package:attendance_montior/screens/login.dart';
import 'package:attendance_montior/screens/mark_attendance_screen.dart';
import 'package:attendance_montior/screens/syllabus_screen.dart';
import 'package:attendance_montior/screens/time_table_screen.dart';
import 'package:get/get.dart';

 class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => HomeScreen(),
    ),
    GetPage(
      name: '/mark',
      page: () => MarkAttendanceScreen(),
    ),
     GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
      GetPage(
      name: '/syllabus',
      page: () => SyllabusScreen(),
    ),
    GetPage(
      name: '/tymtable',
      page: () => TimeTableScreen(),
    ),
  ];
 
}
