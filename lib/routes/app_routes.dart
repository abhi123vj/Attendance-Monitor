import 'package:attendance_montior/screens/attendece_view_screen.dart';
import 'package:attendance_montior/screens/home_screen.dart';
import 'package:attendance_montior/screens/login_screen.dart';
import 'package:attendance_montior/screens/mark_attendance_screen.dart';
import 'package:attendance_montior/screens/signup_screen.dart';
import 'package:attendance_montior/screens/syllabus_screen.dart';
import 'package:attendance_montior/screens/time_table_screen.dart';
import 'package:attendance_montior/screens/time_table_upload_screen.dart';
import 'package:attendance_montior/screens/splash_screen.dart';
import 'package:get/get.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: markAttndcScreen,
      page: () => MarkAttendanceScreen(),
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: signUpScreen,
      transition: Transition.leftToRightWithFade,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: syllabusScreen,
      page: () => const SyllabusScreen(),
    ),
    GetPage(
      name: '/attendenceReview',
      page: () => const AttendenceReview(),
    ),
    GetPage(
      name: '/tymtable',
      page: () => TimeTableScreen(),
    ),
    GetPage(
      name: '/tymtablecreate',
      page: () => const TimetableCreateScreen(),
    ),
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
    ),
  ];
  static String initialPage = loginScreen;

  static String homeScreen = '/';
  static String markAttndcScreen = '/markAttendance';
  static String loginScreen = '/login';
  static String signUpScreen = '/signUp';

  static String syllabusScreen = '/syllabus';
}
