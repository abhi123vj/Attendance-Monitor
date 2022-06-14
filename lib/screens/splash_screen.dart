import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/login.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackGlaze,
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.blackGlaze,
        child: Container(
          height: 43.h,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(color: AppColors.black, blurRadius: 18.0),
            ],
            color: AppColors.blackGlaze,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60), topRight: Radius.circular(60)),
          ),
          child: Stack(children: [
            Positioned(
                left: 170,
                right: 170,
                top: 20,
                child: Text(
                  "UCEK",
                  style: TextStyle(
                      color: AppColors.cyanNormal,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 28, right: 20),
              child: RichText(
                  text: TextSpan(
                      text: "HI there  ",
                      style: TextStyle(color: AppColors.cyanDark, fontSize: 23),
                      children: <TextSpan>[
                    TextSpan(
                      text: "welcome to UCEK Buzz",
                      style:
                          TextStyle(color: AppColors.cyanLight, fontSize: 20),
                    ),
                    TextSpan(
                      text: "\nKeep updated about your attendence and class ",
                      style:
                          TextStyle(color: AppColors.cyanLight, fontSize: 20),
                    ),
                  ])),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 250, left: 182, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.cyanLight,
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 4.w),
                        primary: AppColors.cyanDark,
                        shape: const StadiumBorder()),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}