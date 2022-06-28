import 'package:attendance_montior/constants/user_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../controllers/home_controller.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({Key? key}) : super(key: key);
  final HomeController homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staff Deatils"),
        actions: [
          IconButton(
              onPressed: () {
                homeC.fetchUsers();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Bounce(
                  child: Obx(() => Container(
                        decoration: BoxDecoration(
                            color: homeC.activeUser == UserRoles.teacher
                                ? AppColors.white
                                : AppColors.bgBlack),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(UserRoles.teacher,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: homeC.activeUser != UserRoles.teacher
                                        ? AppColors.white
                                        : AppColors.bgBlack)),
                      )),
                  duration: const Duration(milliseconds: 110),
                  onPressed: () {
                    homeC.changeActiveUSer(UserRoles.teacher);
                  }),
              Bounce(
                  child: Obx(() => Container(
                        decoration: BoxDecoration(
                            color: homeC.activeUser == UserRoles.student
                                ? AppColors.white
                                : AppColors.bgBlack),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(UserRoles.student,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: homeC.activeUser != UserRoles.student
                                        ? AppColors.white
                                        : AppColors.bgBlack)),
                      )),
                  duration: const Duration(milliseconds: 110),
                  onPressed: () {
                    homeC.changeActiveUSer(UserRoles.student);
                  }),
              Bounce(
                  child: Obx(() => Container(
                        decoration: BoxDecoration(
                            color: homeC.activeUser == "Pending"
                                ? AppColors.white
                                : AppColors.bgBlack),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("Pending",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
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
          Expanded(
            child: GetBuilder<HomeController>(
              init: HomeController(),
              initState: (_) {},
              builder: (_) {
                if (homeC.activeUser.value == UserRoles.teacher) {
                  return ListView.builder(
                      itemCount: homeC.techerList.length,
                      itemBuilder: ((context, index) {
                        return Container(
                            child: Column(
                          children: [
                            Text(homeC.techerList.elementAt(index).userName),
                          ],
                        ));
                      }));
                }
                if (homeC.activeUser.value == "Pending") {
                  return ListView.builder(
                      itemCount:homeC.pendingUser[UserRoles.student]?.length??0,
                      itemBuilder: ((context, index) {
                        return Container(
                            child: Column(
                          children: [
                            Text(homeC.pendingUser[UserRoles.student]?.elementAt(index).userName??"listError"),
                          ],
                        ));
                      }));
                } else if (homeC.activeUser.value == UserRoles.student) {
                  return ListView.builder(
                      itemCount: homeC.studentList.length,
                      itemBuilder: ((context, index) {
                        return Text(
                            homeC.studentList.elementAt(index).userName);
                      }));
                } else
                  return SizedBox();
              },
            ),
          )
        ],
      )),
    );
  }
}
