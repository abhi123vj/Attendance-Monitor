import 'dart:developer';

import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

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
                          .headline5
        ),
        actions: [
          IconButton(
              onPressed: () {
                log("Profile icon Tapped");
              },
              icon: Icon(Icons.notifications))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Abhi Ram",
                  style: TextStyle(
                      color: AppColors.cyanNormal,
                      fontSize: 34,
                      fontWeight: FontWeight.w400),
                ),
                Text(homeC.greetingMes.value,
                    style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 0.00,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)),
                color: AppColors.bgWhite,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 10),
                      color: AppColors.black)
                ]),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              classDetails("syllabus", "syllabus"),
              classDetails("results", "Results"),
              classDetails("Attendance", "View"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              classDetails("Time Table", "table"),
              classDetails("Internals", "internal"),
              classDetails("Deadlines", "deadline"),
            ],
          ),
        ],
      ),
    );
  }

  TextButton classDetails(String key, String value) {
    return TextButton(
        onPressed: () {
          if (value == "syllabus") {
            Get.toNamed("/syllabus");
          }else if (value=='table'){
            Get.toNamed('/tymtable');
          }
        },
        child: Container(
            height: 30.w,
            width: 19.w,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  key,
                  style: TextStyle(
                      color: value == "View"
                          ? AppColors.yellowPale
                          : AppColors.cyanLight,
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

  // TextButton subjectButton(String subjectName) {
  // return TextButton(
  //     onPressed: () {},
  //     child: Text(subjectName,
  //         style: TextStyle(
  //             fontSize: 14,
  //             letterSpacing: 0.75,
  //             fontWeight: FontWeight.w500)),
  //     style: ButtonStyle(
  //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //             RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(18.0),
  //                 side: BorderSide(color: AppColors.cyanDark)))));
  // }
}
