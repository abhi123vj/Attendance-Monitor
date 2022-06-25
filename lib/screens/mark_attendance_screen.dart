import 'dart:developer';

import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/controllers/attendc_controller.dart';
import 'package:attendance_montior/screens/upload_screen.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class MarkAttendanceScreen extends StatelessWidget {
  MarkAttendanceScreen({Key? key}) : super(key: key);
  AttendenceController attC = Get.put(AttendenceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mark Attendance",
          style: TextStyle(
              fontSize: 20, letterSpacing: 0.15, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 100.w,
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(bottom: 20, left: 10.w, right: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() => AppFormField(
                    type: "DropDown",
                    hintText: "Semester",
                    list: attC.semList.toList(),
                    controller: attC.semTextEditingController)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() => Text(
                          attC.totalStudents.toString(),
                          style: TextStyle(
                              color: AppColors.cyanNormal,
                              fontSize: 34,
                              letterSpacing: 0.25,
                              fontWeight: FontWeight.w400),
                        )),
                    Obx(() => Text(
                          attC.studentList.length.toString(),
                          style: TextStyle(
                              fontSize: 24,
                              letterSpacing: 0.00,
                              fontWeight: FontWeight.w400),
                        )),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: AppColors.bgWhite,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 5),
                      color: AppColors.bgBlack.withOpacity(.3))
                ]),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: attC.studentList.length + 1,
                itemBuilder: (cntx, index) {
                  final TextEditingController textController =
                      TextEditingController();

                  if (index == attC.studentList.length) {
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0.h, vertical: 1.h),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(UploadScreen());
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 4.w),
                                  primary: AppColors.cyanDark,
                                  shape: const StadiumBorder()),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Container(
                    child: Obx(() => AppFormField(
                          borderColor: attC.studentList
                                      .elementAt(index)["stStatus"] ==
                                  null
                              ? AppColors.yellowPale
                              : attC.studentList.elementAt(index)["stStatus"]
                                  ? AppColors.cyanLight
                                  : AppColors.redNormal,
                          markPresent: () {
                            if (attC.studentList.elementAt(index)["stStatus"] ==
                                    false ||
                                attC.studentList.elementAt(index)["stStatus"] ==
                                    null) {
                              attC.totalStudents++;
                            }
                            attC.studentList.elementAt(index)["stStatus"] =
                                true;
                          },
                          markAbsent: () {
                             if (attC.studentList.elementAt(index)["stStatus"] !=
                                    false &&
                                attC.studentList.elementAt(index)["stStatus"] !=
                                    null) {
                              attC.totalStudents--;
                            }
                            attC.studentList.elementAt(index)["stStatus"] =
                                false;
                          },
                          index: index,
                          hintText: attC.studentList.elementAt(index)["stName"],
                          controller: textController,
                          type: "Mark",
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
