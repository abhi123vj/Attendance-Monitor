import 'package:attendance_montior/config/user_timetable.dart';
import 'package:attendance_montior/constants/app_image_strings.dart';
import 'package:attendance_montior/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

import '../../config/user_session.dart';
import '../../constants/app_colors.dart';
import '../../controllers/home_controller.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    Key? key,
  }) : super(key: key);
  final HomeController homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    homeC.animationList.shuffle();
    return Drawer(
      width: 60.w,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 100,
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: RiveAnimation.asset(
                  AppImages.bearAnimRive, //'PopOutRightidle','PopOutBot',
                  animations: homeC.animationList.first,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
          ListTile(
            title: Text('Student Details',
                style: Theme.of(context).textTheme.subtitle1),
            onTap: () {
              /// Get.toNamed(AppRoutes.userDetails);
            },
          ),
          ListTile(
            title:
                Text('Log Out', style: Theme.of(context).textTheme.subtitle1),
            onTap: () {
              logoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  logoutDialog(BuildContext cntx) {
    Get.defaultDialog(
        title: "Log Out",
        middleText: "Do you want to Logout?",
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
                  "Logout",
                  style: Theme.of(cntx)
                      .textTheme
                      .button
                      ?.copyWith(color: AppColors.bgBlack),
                )),
            duration: const Duration(milliseconds: 110),
            onPressed: () {
              UserSession().clearSession();
              UserTimeTable().clearSession();
              Get.offNamed(AppRoutes.loginScreen);
            }));
  }
}
