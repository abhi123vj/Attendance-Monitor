import 'dart:developer';

import 'package:attendance_montior/config/user_timetable.dart';
import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/routes/app_routes.dart';
import 'package:attendance_montior/screens/attendce_detial.dart';
import 'package:attendance_montior/screens/widgets/app_drawer.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
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
                homeC.isAppbarLoading.value = true;
                homeC.inintFunction();
              },
              icon: SizedBox(
                height: 20,
                width: 20,
                child: Obx(() => homeC.isAppbarLoading.isTrue
                    ? CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.bgBlack,
                      )
                    : Icon(Icons.refresh)),
              ))
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi,${homeC.userName}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  homeC.greetingMes.value,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                color: AppColors.bgWhite,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: .3,
                      blurRadius: 4,
                      offset: const Offset(0, 6),
                      color: AppColors.bgBlack.withOpacity(.2))
                ]),
          ),
          SizedBox(
            height: 2.h,
          ),
       GetBuilder<HomeController>(
         init: HomeController(),
         initState: (_) {},
         builder: (_) {
           return Column(
                       mainAxisSize: MainAxisSize.min,
                       children: homeC.nextClasss.value.subjectName == null
                           ? []
                           : [
                               Text(
                                 "Upcoming class",
                                 style: Theme.of(context).textTheme.subtitle1,
                               ),
                               SizedBox(
                                 height: 10,
                               ),
                               Padding(
                                 padding: EdgeInsets.symmetric(horizontal: 10),
                                 child: Material(
                                  elevation: 2,
                                   child: Container(
                                     width: 100.w,
                                     child: Container(
                                       child: Column(
                                         mainAxisSize: MainAxisSize.min,
                                         children: [
                                           Container(
                                               decoration: BoxDecoration(
                                                 color: AppColors.accentGreen,
                                                 
                                               ),
                                               padding: EdgeInsets.symmetric(
                                                   horizontal: 10, vertical: 10),
                                               child: Row(
                                                 mainAxisAlignment:
                                                     MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Text(
                                                       "${homeC.nextClasss.value.startTime} - ${homeC.nextClasss.value.endTime}",
                                                       style: Theme.of(context)
                                                           .textTheme
                                                           .caption?.copyWith(fontWeight: FontWeight.w600)),
                                                   Text(
                                                       "${homeC.nextClasss.value.semester} ${homeC.nextClasss.value.branch}",
                                                       style: Theme.of(context)
                                                           .textTheme
                                                           .subtitle1),
                                                 ],
                                               )),
                                           Container(
                                               padding: EdgeInsets.symmetric(
                                                   horizontal: 10, vertical: 10),
                                               child: Text(
                                                   homeC.nextClasss.value.subjectName ??
                                                       "No class",
                                                   style: Theme.of(context)
                                                       .textTheme
                                                       .headline6)),
                                         ],
                                       ),
                                       decoration: BoxDecoration(
                                           color: AppColors.white),
                                         
                                        )                 ),
                                 ),
                          ),
                        
                        SizedBox(
                          height: 10,
                        ),
                      ],
              );
          
         },)


















          ,Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              classDetails("syllabus", "View"),
              classDetails("results", "Results"),
              classDetails("Attendance", "View"),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              classDetails("Time Table", "table"),
              classDetails("Internals", "View"),
              classDetails("Notify", "deadline"),
            ],
          ),
        ],
      ),
    );
  }

  TextButton classDetails(String key, String value) {
    return TextButton(
        onPressed: () {
          if (key == "syllabus") {
            Get.toNamed("/syllabus");
          }
          if (key == "Time Table") {
            Get.toNamed("/tymtable");
          }
          if (key == "Attendance") {
           Get.toNamed(AppRoutes.markAttndcScreen);
          }
          if (key == "Notify") {
           

            Get.toNamed(AppRoutes.notificationScreen);
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
