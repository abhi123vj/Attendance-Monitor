import 'package:attendance_montior/screens/home_screen.dart';
import 'package:attendance_montior/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => SplashScreen(),
    ),
  ];
}
