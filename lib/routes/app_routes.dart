import 'package:attendance_montior/screens/attendanceReport.dart';
import 'package:attendance_montior/screens/attendance_check.dart';
import 'package:attendance_montior/screens/attendece_view_screen.dart';
import 'package:attendance_montior/screens/home_screen.dart';
import 'package:attendance_montior/screens/login_screen.dart';
import 'package:attendance_montior/screens/mark_attendance_screen.dart';
import 'package:attendance_montior/screens/notification_screen.dart';
import 'package:attendance_montior/screens/pdfScreen.dart';
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
      page: () => SyllabusScreen(),
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
      name: splashSCreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: notificationScreen,
      page: () => NotifyScreen(),
    ),
    GetPage(
      name: attendanceDisplay,
      page: () => AttendanceDisplay(),
    ),
    GetPage(
      name: pdfScreen,
      page: () => PDFScreen(),
    ),
        GetPage(
      name: attdncReport,
      page: () => AttdncReport(),
    ),
  ];

  ///?init page
  static String initialPage = splashSCreen;

  static String homeScreen = '/';
  static String markAttndcScreen = '/markAttendance';
  static String loginScreen = '/login';
  static String signUpScreen = '/signUp';
  static String splashSCreen = '/splash';
  static String syllabusScreen = '/syllabus';
  static String notificationScreen = '/notify';
  static String attendanceDisplay = '/attendanceDisplay';
  static String pdfScreen = '/pdfScreen';
    static String attdncReport = '/attdncReport';

}
