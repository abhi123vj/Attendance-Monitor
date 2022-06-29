import 'dart:async';
import 'dart:developer';

import 'package:attendance_montior/config/user_session.dart';
import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/constants/app_image_strings.dart';
import 'package:attendance_montior/constants/app_strings.dart';
import 'package:attendance_montior/routes/app_routes.dart';
import 'package:attendance_montior/screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserData();
  }

  checkUserData() {
    Timer(const Duration(seconds: 3), (() async {
      await UserSession().initUserSession();
      if (UserSession().isLoggedIn()) {
        log("User satstus true");
        Get.offNamed(AppRoutes.homeScreen);
      } else {
        Get.offNamed(AppRoutes.loginScreen);
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: Stack(children: [
          Positioned(
              bottom: -14.h,
              width: 100.w,
              child: Container(
                  child: SvgPicture.asset(
                AppImages.clgLogo,
                //color: AppColors.bgWhite,
                // colorBlendMode: BlendMode.src,
              )))
        ]));
  }
}
