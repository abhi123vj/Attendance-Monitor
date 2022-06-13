import 'dart:developer';

import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../controllers/suject_controller.dart';

class SyllabusScreen extends StatelessWidget {
  const SyllabusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubjectController subC = Get.put(SubjectController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Syllabus",
          style: TextStyle(
              fontSize: 20, letterSpacing: 0.15, fontWeight: FontWeight.w500),
        ),
      ),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 100.w,
              padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppFormField(
                      type: "DropDown",
                      hintText: "Semester",
                      list: subC.semList.toList(),
                      controller: subC.semTextEditingController),
                  subC.subjectsMap.isNotEmpty
                      ? AppFormField(
                          type: "DropDown",
                          hintText: "Subject",
                          list: subC.subjectsMap.entries
                              .map((entry) => entry.value.subjectName)
                              .toList(),
                          controller: subC.subTextEditingController)
                      : SizedBox(),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0)),
                  color: AppColors.blackGlaze,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 10),
                        color: AppColors.black)
                  ]),
            ),
        
             Expanded(
              
              child: subC.isSyllabusEmplty.isFalse? SingleChildScrollView(
                child: Column(
                children: [
                    Text(
                  "Module 1",
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Text(
                      subC.syllabus.value.module1,
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 0.10,
                          fontWeight: FontWeight.w500),
                    )),
                Text(
                  "Module 2",
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w500),
                ),               
                  SizedBox(
                    height: 10,
                  ),
                          Obx(() => Text(
                    subC.syllabus.value.module2,
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.10,
                        fontWeight: FontWeight.w500),
                  )),
                          Text(
                "Module 3",
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.15,
                    fontWeight: FontWeight.w500),
                          ),
                Obx(() => Text(
                    subC.syllabus.value.module2,
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.10,
                        fontWeight: FontWeight.w500),
                  )),
                          Text(
                "Module 4",
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.15,
                    fontWeight: FontWeight.w500),
                          ),
                Obx(() => Text(
                    subC.syllabus.value.module2,
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.10,
                        fontWeight: FontWeight.w500),
                  )),
                ],
                           ),
              )
             :  Center(child: Text("No Data"),)
             )
          ],
        ),
      ),
    );
  }
}
