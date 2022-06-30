import 'dart:developer';

import 'package:attendance_montior/constants/app_strings.dart';
import 'package:attendance_montior/constants/user_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../controllers/home_controller.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({Key? key}) : super(key: key);
  final HomeController homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Staff Deatils",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                homeC.fetchUsers();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
          child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Bounce(
                    child: Obx(() => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10),
                              ),
                              color: homeC.activeUser == UserRoles.teacher
                                  ? AppColors.white
                                  : AppColors.bgBlack),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(UserRoles.teacher,
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                      color:
                                          homeC.activeUser != UserRoles.teacher
                                              ? AppColors.white
                                              : AppColors.bgBlack)),
                        )),
                    duration: const Duration(milliseconds: 110),
                    onPressed: () {
                      homeC.changeActiveUSer(UserRoles.teacher);
                    }),
                Bounce(
                    child: Obx(() => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: homeC.activeUser == UserRoles.student
                                  ? AppColors.white
                                  : AppColors.bgBlack),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(UserRoles.student,
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                      color:
                                          homeC.activeUser != UserRoles.student
                                              ? AppColors.white
                                              : AppColors.bgBlack)),
                        )),
                    duration: const Duration(milliseconds: 110),
                    onPressed: () {
                      homeC.changeActiveUSer(UserRoles.student);
                    }),
                Bounce(
                    child: Obx(() => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(10)),
                              color: homeC.activeUser == "Pending"
                                  ? AppColors.white
                                  : AppColors.bgBlack),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text("Pending",
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                      color: homeC.activeUser != "Pending"
                                          ? AppColors.white
                                          : AppColors.bgBlack)),
                        )),
                    duration: const Duration(milliseconds: 110),
                    onPressed: () {
                      homeC.changeActiveUSer("Pending");
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GetBuilder<HomeController>(
              init: HomeController(),
              initState: (_) {},
              builder: (_) {
                if (homeC.isLoading.isTrue) {
                  return Center(
                    child: LoadingAnimationWidget.inkDrop(
                      size: 20.w,
                      color: AppColors.white,
                    ),
                  );
                }
                if (homeC.activeUser.value == UserRoles.teacher) {
                  return homeC.techerList.isEmpty
                      ? Center(
                          child: Text(AppMessages.emplyList,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(fontWeight: FontWeight.w500)))
                      : ListView.builder(
                          itemCount: homeC.techerList.length,
                          itemBuilder: ((context, index) {
                            //?repace With listItemWIdget
                            return GestureDetector(
                              onTap: () {
                                ClipboardPrompt(
                                    homeC.pendingUser[UserRoles.teacher]
                                        ?.elementAt(index)
                                        .userName,
                                    homeC.pendingUser[UserRoles.teacher]
                                        ?.elementAt(index)
                                        .email,
                                    context);
                              },
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: const BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: AppColors.accentGreen),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              homeC.techerList
                                                  .elementAt(index)
                                                  .userName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                          Text(
                                              homeC.techerList
                                                  .elementAt(index)
                                                  .dept,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              homeC.techerList
                                                  .elementAt(index)
                                                  .email,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2),
                                          Text(
                                              "+91 ${homeC.techerList.elementAt(index).mobnumber}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2),
                                        ],
                                      ),
                                    ],
                                  )),
                            );
                          }));
                } else if (homeC.activeUser.value == UserRoles.student) {
                  return homeC.studentList.isEmpty
                      ? Center(
                          child: Text(AppMessages.emplyList,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(fontWeight: FontWeight.w500)))
                      : ListView.builder(
                          itemCount: homeC.studentList.length,
                          itemBuilder: ((context, index) {
                            //?repace With listItemWIdget
                            return GestureDetector(
                              onTap: () {
                                ClipboardPrompt(
                                    homeC.pendingUser[UserRoles.teacher]
                                        ?.elementAt(index)
                                        .userName,
                                    homeC.pendingUser[UserRoles.teacher]
                                        ?.elementAt(index)
                                        .email,
                                    context);
                              },
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: const BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: AppColors.accentYellow),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              homeC.studentList
                                                  .elementAt(index)
                                                  .userName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600)),
                                          Text(
                                              homeC.studentList
                                                  .elementAt(index)
                                                  .dept,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              homeC.studentList
                                                  .elementAt(index)
                                                  .email,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2),
                                          Text(
                                              "+91 ${homeC.studentList.elementAt(index).mobnumber}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2),
                                        ],
                                      ),
                                    ],
                                  )),
                            );
                          }));
                } else if (homeC.activeUser.value == "Pending") {
                  //?replace wit hwidget 2
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Teachers",
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      homeC.pendingUser[UserRoles.teacher]?.isEmpty ?? true
                          ? Center(
                              child: Text(AppMessages.emplyList,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(fontWeight: FontWeight.w500)))
                          : Container(
                              constraints: BoxConstraints(maxHeight: 40.h),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: homeC
                                          .pendingUser[UserRoles.teacher]
                                          ?.length ??
                                      0,
                                  itemBuilder: ((context, index) {
                                    //?repace With listItemWIdget
                                    return GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            homeC.pendingUser[UserRoles.teacher]
                                                ?.elementAt(index)
                                                .userName,
                                            homeC.pendingUser[UserRoles.teacher]
                                                ?.elementAt(index)
                                                .email,
                                            context);
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Material(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          elevation: 2,
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: AppColors.accentGreen),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          homeC.pendingUser[
                                                                      UserRoles
                                                                          .teacher]
                                                                  ?.elementAt(
                                                                      index)
                                                                  .userName ??
                                                              'List Error',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline5
                                                              ?.copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                      Text(
                                                          homeC.pendingUser[
                                                                      UserRoles
                                                                          .teacher]
                                                                  ?.elementAt(
                                                                      index)
                                                                  .dept ??
                                                              "err Dpt",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline6),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          homeC.pendingUser[
                                                                      UserRoles
                                                                          .teacher]
                                                                  ?.elementAt(
                                                                      index)
                                                                  .email ??
                                                              "errEmail",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle2),
                                                      Text(
                                                          "+91 ${homeC.pendingUser[UserRoles.teacher]?.elementAt(index).mobnumber}",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle2),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    );
                                  })),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Studnets",
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      Container(
                        constraints: BoxConstraints(maxHeight: 40.h),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: homeC.pendingUser[UserRoles.student]?.isEmpty ??
                                true
                            ? Center(
                                child: Text(AppMessages.emplyList,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500)))
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: homeC.pendingUser[UserRoles.student]
                                        ?.length ??
                                    0,
                                itemBuilder: ((context, index) {
                                  //?repace With listItemWIdget
                                  return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: AppColors.accentYellow),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  homeC.pendingUser[
                                                              UserRoles.student]
                                                          ?.elementAt(index)
                                                          .userName ??
                                                      'List Error',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                              Text(
                                                  homeC.pendingUser[
                                                              UserRoles.student]
                                                          ?.elementAt(index)
                                                          .dept ??
                                                      "err Dpt",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  homeC.pendingUser[
                                                              UserRoles.student]
                                                          ?.elementAt(index)
                                                          .email ??
                                                      "errEmail",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2),
                                              Text(
                                                  "+91 ${homeC.pendingUser[UserRoles.student]?.elementAt(index).mobnumber}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2),
                                            ],
                                          ),
                                        ],
                                      ));
                                })),
                      )
                    ],
                  );
                } else {
                  return Center(
                      child: Text(AppMessages.emplyList,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(fontWeight: FontWeight.w500)));
                }
              },
            ),
          )
        ],
      )),
    );
  }

  showDialog(String? name, String? email, BuildContext cntx) {
    Get.defaultDialog(
        title: "Verify user",
        middleText: "Do you want to accept $name?",
        backgroundColor: AppColors.bgBlack,
        titleStyle: Theme.of(cntx)
            .textTheme
            .headline6
            ?.copyWith(color: AppColors.bgWhite),
        middleTextStyle: Theme.of(cntx)
            .textTheme
            .subtitle2
            ?.copyWith(color: AppColors.white),
        cancel: Bounce(
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: AppColors.white),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Text("Reject")),
            duration: const Duration(milliseconds: 110),
            onPressed: () {
              if (email != null) {
                homeC.updateUserStatus(email, 'Rejected');
              } else {
                log("No Email fond");
              }
              Get.back();
              log("Reject");
            }),
            custom: Bounce(child: Container(
                decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: AppColors.white),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Text("Reject")),, duration: Duration(milliseconds: 20), onPressed:  () {
              if (email != null) {
                homeC.updateUserStatus(email, 'Accepted');
              } else {
                log("No Email fond");
              }
              Get.back();
            }),
        confirm: Bounce(
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.accentGreen),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Text("Accept")),
            duration: const Duration(milliseconds: 110),
            onPressed: () {
              if (email != null) {
                homeC.updateUserStatus(email, 'Accepted');
              } else {
                log("No Email fond");
              }
              Get.back();
            }));
  }

  ClipboardPrompt(String? name, String? email, BuildContext cntx) {
    Get.defaultDialog(
        title: "Verify user",
        middleText: "Do you want to accept $name?",
        backgroundColor: AppColors.bgBlack,
        titleStyle: Theme.of(cntx)
            .textTheme
            .headline6
            ?.copyWith(color: AppColors.bgWhite),
        middleTextStyle: Theme.of(cntx)
            .textTheme
            .subtitle2
            ?.copyWith(color: AppColors.white),
        cancel: Bounce(
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: AppColors.white),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Text("Reject")),
            duration: const Duration(milliseconds: 110),
            onPressed: () {
              if (email != null) {
                homeC.updateUserStatus(email, 'Rejected');
              } else {
                log("No Email fond");
              }
              Get.back();
              log("Reject");
            }),
        confirm: Bounce(
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.accentGreen),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Text("Accept")),
            duration: const Duration(milliseconds: 110),
            onPressed: () {
              if (email != null) {
                homeC.updateUserStatus(email, 'Accepted');
              } else {
                log("No Email fond");
              }
              Get.back();
            })
            
            );
  }
}
