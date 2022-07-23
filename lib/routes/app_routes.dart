import 'package:attendance_montior/screens/home_screen.dart';
import 'package:attendance_montior/screens/login.dart';
import 'package:attendance_montior/screens/mark_attendance_screen.dart';
import 'package:attendance_montior/screens/signup.dart';
import 'package:attendance_montior/screens/splash_screen.dart';
import 'package:attendance_montior/screens/syllabus_screen.dart';
import 'package:attendance_montior/screens/time_table_screen.dart';
import 'package:get/get.dart';

 class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: '/mark',
      page: () => MarkAttendanceScreen(),
    ),
     GetPage(
      name: loginScreen,
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
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
    ),
  ];


   static String initialPage = loginScreen;

  static String homeScreen = '/';
  static String userDetails = '/userDetails';
  static String markAttndcScreen = '/markAttendance';
  static String loginScreen = '/login';
  static String signUpScreen = '/signUp';
  static String splashSCreen = '/splash';

  static String syllabusScreen = '/syllabus';
 
}
