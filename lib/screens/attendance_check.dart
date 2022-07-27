import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/routes/app_routes.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../config/user_session.dart';
import '../controllers/attendc_controller.dart';
import '../models/attendence_model.dart';

class AttendanceDisplay extends StatelessWidget {
  AttendanceDisplay({Key? key}) : super(key: key);
  AttendenceController attC = Get.put(AttendenceController());
  @override
  Widget build(BuildContext context) {
    attC.getStudentAttendence();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Class Name",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: UserSession().user?.subjects.length ?? 0,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Bounce(
                      duration: const Duration(milliseconds: 110),
                      onPressed: () {
                        attC.selectedIndex.value = index;
                        attC.getStudentAttendence();
                      },
                      child: Obx(() => Container(
                            width: 130,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: attC.selectedIndex.value == index
                                    ? AppColors.bgBlack
                                    : AppColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              UserSession()
                                  .user!
                                  .subjects
                                  .elementAt(index)
                                  .subjectName,
                              style:
                                  Theme.of(context).textTheme.button?.copyWith(
                                        color: attC.selectedIndex.value == index
                                            ? AppColors.white
                                            : AppColors.bgBlack,
                                      ),
                            ),
                          )));
                }),
          ),
          Expanded(
            child: GetBuilder<AttendenceController>(
              builder: (_) {
                if (attC.isloading.isTrue) {
                  return Center(
                    child: LoadingAnimationWidget.dotsTriangle(
                      size: 50,
                      color: AppColors.accentGreen,
                    ),
                  );
                }
                if (attC.dates.isEmpty) {
                  return Center(child: Text("Class Yet To Start"));
                }
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Total ${attC.dates.length} classes ",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                            itemCount: attC.studentAttendance.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              StudentAttendance studentData =
                                  attC.studentAttendance.elementAt(index);
                              int totalClass = studentData.attendance.length;
                              int totatlAttdnc = attC.totalAttendance
                                  .elementAt(index)
                                  .reduce((a, b) => a + b);
                              // return Text(studentData.name +
                              //     " " +
                              //     totatlAttdnc.toString() +
                              //     " " +
                              //    totalClass
                              //         .toString());
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(studentData.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    Bounce(
                                      duration:
                                          const Duration(milliseconds: 110),
                                      onPressed: () {
                                        //!! Open link
                                        Get.toNamed(AppRoutes.attdncReport,
                                            arguments: [
                                              studentData.name,
                                              attC.totalAttendance
                                                  .elementAt(index),
                                                  attC.dates
                                            ]);
                                      },
                                      child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              color: AppColors.bgBlack),
                                          child: Text(
                                            totatlAttdnc.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .button
                                                ?.copyWith(
                                                    color: AppColors.white),
                                          )),
                                    ),
                                  ],
                                ),
                              );
                            })),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ]));
  }
}
