import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/upload_screen.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

class MarkAttendanceScreen extends StatelessWidget {
  const MarkAttendanceScreen({Key? key}) : super(key: key);

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
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "S5 CSE",
                  style: TextStyle(
                      color: AppColors.cyanLight,
                      fontSize: 34,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 20.w,
                  child: Column(
                    children: [
                      Text(
                        "0",
                        style: TextStyle(
                            color: AppColors.cyanNormal,
                            fontSize: 34,
                            letterSpacing: 0.25,
                            fontWeight: FontWeight.w400),
                      ),
                      Divider(
                        color: AppColors.redNormal,
                      ),
                      Text(
                        "45",
                        style: TextStyle(
                            fontSize: 24,
                            letterSpacing: 0.00,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: AppColors.blackGlaze,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 6),
                      color: AppColors.black)
                ]),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 45 + 1,
                itemBuilder: (cntx, index) {
                  final TextEditingController textController =
                      TextEditingController();
                  if (index == 45) {
                    return Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0.h,vertical: 1.h),
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
                    child: AppFormField(
                      controller: textController,
                      type: "Mark",
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
