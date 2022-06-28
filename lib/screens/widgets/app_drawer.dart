import 'package:attendance_montior/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Drawer(
      width: 60.w,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: 20, top: MediaQuery.of(context).padding.top),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  // "Hi,${homeC.currentuser!.name}",
                  UserSession().user?.name ?? "name",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.w600),
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
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: .5,
                      blurRadius: 4,
                      offset: const Offset(0, 6),
                      color: AppColors.bgBlack.withOpacity(.4))
                ]),
          ),
          ListTile(
            title: Text('Staff Details',
                style: Theme.of(context).textTheme.subtitle1),
            onTap: () {
              Get.toNamed(AppRoutes.userDetails);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
