import 'dart:developer';

import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/attendce_detial.dart';
import 'package:attendance_montior/screens/widgets/app_drawer.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
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
                log("Profile icon Tapped");
              },
              icon: const Icon(Icons.notifications))
        ],
      ),
       drawer: AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Text(
                  homeC.greetingMes.value,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Bounce(
                  child: Container(
                    decoration: BoxDecoration(color: AppColors.white),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("All Users"),
                  ),
                  duration: const Duration(milliseconds: 110),
                  onPressed: () {
                    homeC.fetchUsers();
                  }),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        
        ],
      ),
    );
  }
}
