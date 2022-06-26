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
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold)
              .copyWith(color: AppColors.white),
        ),
        iconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.bgBlack,
      ),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppFormField(
                      type: "DropDown",
                      hintText: "Semester",
                      list: subC.semList.toList(),
                      controller: subC.semTextEditingController),
                  SizedBox(
                    height: 10,
                  ),
                  if (subC.subjectsMap.isNotEmpty)
                    AppFormField(
                        type: "DropDown",
                        hintText: "Subject",
                        list: subC.subjectsMap.entries
                            .map((entry) => entry.value.toString())
                            .toList(),
                        controller: subC.subTextEditingController),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      if(subC.syllabus.value.credits!=null)
                      Text("Credits: ${subC.syllabus.value.credits}"  ,  style: Theme.of(context)
                                    .textTheme
                                    .button,
                      ),                     
                    ],
                  ),
               
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  color: AppColors.bgBlack,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: .5,
                        blurRadius: 4,
                        offset: const Offset(0, 6),
                        color: AppColors.bgBlack.withOpacity(.4))
                  ]),
            ),
            if (subC.syllabus.value.modules?.isNotEmpty ?? false)
              Expanded(
                  child: Obx(() => ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: subC.syllabus.value.modules?.length,
                      itemBuilder: (context, index) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 100.0,
                            maxHeight: 400,
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? AppColors.accentGreen
                                    : AppColors.accentYellow,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  subC.syllabus.value.modules
                                          ?.elementAt(index)
                                          .moduleName ??
                                      "Module",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: subC.syllabus.value.modules
                                        ?.elementAt(index)
                                        .moduleData
                                        ?.length,
                                    itemBuilder: (context, index2) {
                                      return Text(
                                          subC.syllabus.value.modules
                                                  ?.elementAt(index)
                                                  .moduleData
                                                  ?.elementAt(index2) ??
                                              "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2);
                                    })
                              ],
                            ),
                          ),
                        );
                      })))
          ],
        ),
      ),
    );
  }
}
