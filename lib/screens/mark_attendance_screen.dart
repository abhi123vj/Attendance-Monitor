import 'dart:developer';

import 'package:attendance_montior/config/user_session.dart';
import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/controllers/attendc_controller.dart';
import 'package:attendance_montior/models/student_list_res.dart';
import 'package:attendance_montior/screens/upload_screen.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';
import '../routes/app_routes.dart';

class MarkAttendanceScreen extends StatelessWidget {
  MarkAttendanceScreen({Key? key}) : super(key: key);
  AttendenceController attC = Get.put(AttendenceController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController topicTextEditingController =
        TextEditingController();

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
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
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
                              attC.getStudentListFor();
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text(
                                    UserSession()
                                        .user!
                                        .subjects
                                        .elementAt(index)
                                        .subjectName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        ?.copyWith(
                                          color:
                                              attC.selectedIndex.value == index
                                                  ? AppColors.white
                                                  : AppColors.bgBlack,
                                        ),
                                  ),
                                )));
                      }),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: AppColors.bgWhite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.accentGreen,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              attC.totalStudents.toString(),
                              style: TextStyle(
                                  color: AppColors.bgBlack,
                                  fontSize: 34,
                                  letterSpacing: 0.25,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text("Present",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(color: AppColors.black)),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.accentYellow,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              attC.studentList.length.toString(),
                              style: TextStyle(
                                  color: AppColors.bgBlack,
                                  fontSize: 34,
                                  letterSpacing: 0.25,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text("Total Students ",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(color: AppColors.black)),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => attC.isloading.isTrue
                ? Center(
                    child: LoadingAnimationWidget.dotsTriangle(
                      size: 50,
                      color: AppColors.accentGreen,
                    ),
                  )
                : ListView.builder(
                    itemCount: attC.studentList.length,
                    itemBuilder: (cntx, index) {
                      final TextEditingController textController =
                          TextEditingController();

                      // if (index == attC.studentList.length) {
                      //   return Row(
                      //     children: [
                      //       Expanded(
                      //         child: Padding(
                      //           padding: EdgeInsets.symmetric(
                      //               horizontal: 5.0.h, vertical: 1.h),
                      //           child: ElevatedButton(
                      //             onPressed: () {
                      //               Get.to(UploadScreen());
                      //             },
                      //             child: Text(
                      //               'Next',
                      //               style: TextStyle(
                      //                   fontSize: 17, fontWeight: FontWeight.w500),
                      //             ),
                      //             style: ElevatedButton.styleFrom(
                      //                 padding: EdgeInsets.symmetric(vertical: 4.w),
                      //                 primary: AppColors.cyanDark,
                      //                 shape: const StadiumBorder()),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   );
                      // }
                      StudentsList stData =
                          attC.studentList.elementAt(index) as StudentsList;
                      return GetBuilder<AttendenceController>(
                        builder: (_) {
                          return Container(
                            margin: EdgeInsets.only(
                                bottom: 10, left: 10.w, right: 10.w),
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)),
                              border: Border.all(
                                  color: stData.status == null
                                      ? AppColors.yellowPale
                                      : stData.status ?? false
                                          ? AppColors.cyanDark
                                          : AppColors.redNormal,
                                  width: 2),
                            ),
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text("${index + 1}.",
                                          style: TextStyle(
                                              fontSize: 20,
                                              letterSpacing: 0.15,
                                              fontWeight: FontWeight.w500)),
                                      Expanded(
                                        child: Text(stData.name,
                                            style: TextStyle(
                                                fontSize: 20,
                                                letterSpacing: 0.15,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (stData.status == false ||
                                          stData.status == null) {
                                        attC.totalStudents++;
                                      }
                                      stData.status = true;
                                      attC.checkMarking();

                                      attC.update();
                                    },
                                    icon: Icon(
                                      Icons.check,
                                      color: AppColors.cyanDark,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      if (stData.status != false &&
                                          stData.status != null) {
                                        attC.totalStudents--;
                                      }
                                      stData.status = false;
                                      attC.checkMarking();

                                      attC.update();
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: AppColors.redDark,
                                    ))
                              ],
                            ),
                          );
                        },
                      );
                    })),
          ),
          Bounce(
              duration: const Duration(milliseconds: 110),
              onPressed: () {
                selectHour(context);
              },
              child: Obx(() => attC.isAllMarker.isTrue &&attC.isloading.isFalse
                  ? Container(
                      width: 80.w,
                      height: 10.w,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 10),
                      decoration: BoxDecoration(
                          color: AppColors.bgBlack,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        "Upload",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: AppColors.white),
                      ),
                    )
                  : SizedBox()))
        ],
      ),
    );
  }

  selectHour(BuildContext cntx) {
    Get.defaultDialog(
        title: "Select class Hour",
        middleText: "Enter topics coverd and period",
        backgroundColor: AppColors.bgBlack,
        titleStyle: Theme.of(cntx)
            .textTheme
            .headline6
            ?.copyWith(color: AppColors.bgWhite),
        middleTextStyle: Theme.of(cntx)
            .textTheme
            .subtitle2
            ?.copyWith(color: AppColors.white),
        content: Wrap(
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.center,
          children: [
            hourbutton(cntx, "1st", 1, attC),
            hourbutton(cntx, "2nd", 2, attC),
            hourbutton(cntx, "3rd", 3, attC),
            hourbutton(cntx, "4th", 4, attC),
            hourbutton(cntx, "5th", 5, attC)
          ],
        ),
        cancel: Bounce(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.bgWhite),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.bgBlack),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Cancel",
                  style: Theme.of(cntx)
                      .textTheme
                      .button
                      ?.copyWith(color: AppColors.bgWhite),
                )),
            duration: const Duration(milliseconds: 110),
            onPressed: () {
              Get.back();
            }),
        confirm: Bounce(
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.accentYellow),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "upload",
                  style: Theme.of(cntx)
                      .textTheme
                      .button
                      ?.copyWith(color: AppColors.bgBlack),
                )),
            duration: const Duration(milliseconds: 110),
            onPressed: () {
              Get.back();
              selectTopics(cntx);
              // Get.offNamed(AppRoutes.homeScreen);
            }));
  }

  selectTopics(BuildContext cntx) {
    TextEditingController topicTextEditingController = TextEditingController();
    Get.defaultDialog(
        title: "Enter your Topics",
        middleText: "Enter topics coverd and period",
        backgroundColor: AppColors.bgBlack,
        titleStyle: Theme.of(cntx)
            .textTheme
            .headline6
            ?.copyWith(color: AppColors.bgWhite),
        middleTextStyle: Theme.of(cntx)
            .textTheme
            .subtitle2
            ?.copyWith(color: AppColors.white),
        content: TextFormField(
          style: Theme.of(cntx)
              .textTheme
              .subtitle1
              ?.copyWith(color: AppColors.accentYellow),
          minLines: 1,
          controller: topicTextEditingController,
          maxLines: 12,
          onChanged: (str) {},
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintStyle: Theme.of(cntx)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: AppColors.white.withOpacity(.7)),
              hintText: "Add Topics.."),
        ),
        cancel: Bounce(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.bgWhite),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.bgBlack),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Cancel",
                  style: Theme.of(cntx)
                      .textTheme
                      .button
                      ?.copyWith(color: AppColors.bgWhite),
                )),
            duration: const Duration(milliseconds: 110),
            onPressed: () {
              Get.back();
            }),
        confirm: Bounce(
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.accentYellow),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "upload",
                  style: Theme.of(cntx)
                      .textTheme
                      .button
                      ?.copyWith(color: AppColors.bgBlack),
                )),
            duration: const Duration(milliseconds: 110),
            onPressed: () {
              attC.topics = topicTextEditingController.text;
              attC.markAttendece();
              //selectHour(cntx);
              Get.back();
             
            }));
  }

  Padding hourbutton(
      BuildContext cntx, String value, int index, AttendenceController attc) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Bounce(
          child: Obx(() => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: index == attc.selcetdHourIndex.value
                      ? AppColors.white
                      : AppColors.bgBlack),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                value,
                style: Theme.of(cntx).textTheme.button?.copyWith(
                    color: index == attc.selcetdHourIndex.value
                        ? AppColors.bgBlack
                        : AppColors.white),
              ))),
          duration: const Duration(milliseconds: 110),
          onPressed: () {
            attc.selcetdHourIndex.value = index;
            // Get.offNamed(AppRoutes.homeScreen);
          }),
    );
  }
}
