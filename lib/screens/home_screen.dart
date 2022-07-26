import 'dart:developer';

import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/routes/app_routes.dart';
import 'package:attendance_montior/screens/attendce_detial.dart';
import 'package:attendance_montior/screens/widgets/app_drawer.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../config/user_session.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController tmp = TextEditingController();
  HomeController homeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "UCEK Buzz",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                log("Profile icon Tapped");
              },
              icon: const Icon(Icons.notifications))
        ],
      ),
       drawer: AppDrawer(),
      body: Padding(
        padding:  EdgeInsets.only(left:8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Text(
                    homeC.greetingMes.value,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
            SizedBox(
              height: 5.h,
            ),
           
            SizedBox(
              height: 10,
            ),
            classDetails("Create Subject", "View"),
          
          ],
        ),
      ),
    );
  }
}
TextButton classDetails(String key, String value) {
    return TextButton(
        onPressed: () {
          if (key == "Create Subject") {
            Get.toNamed(AppRoutes.createSubject);
          }
         
        
        },
        child: Container(
            height: 30.w,
            width: 19.w,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  key,
                  style: TextStyle(
                      color: value == "View"
                          ? AppColors.bgBlack
                          : AppColors.bgBlack,
                      fontSize: 14,
                      letterSpacing: 0.10,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                        color: value == "View"
                            ? AppColors.yellowPale
                            : AppColors.cyanLight)))));
  }