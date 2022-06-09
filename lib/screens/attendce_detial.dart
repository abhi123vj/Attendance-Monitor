import 'dart:developer';

import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:attendance_montior/screens/attendece_view_screen.dart';

class ADetialView extends StatelessWidget {
  const ADetialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text(
            "Attendance",
            style: TextStyle(
                fontSize: 20, letterSpacing: 0.15, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  log("Profile icon Tapped");
                },
                icon: Icon(Icons.notifications))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: 100.w,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                        color: AppColors.cyanLight,
                        fontSize: 22,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w400),
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
            details('Present', '35', 'Name', 'RollNo.',35,AppColors.yellowPale),
            SizedBox(
                   height: 5.0.h,
                  ),
            details('Absenties', '10', 'Name', 'RollNo.',10,AppColors.redDark),
            SizedBox(
                   height: 5.0.h,
                  ),
          ]),
        )));
  }

  Widget details(t1, t2, t3, t4,t5,clr) {
    return Container(
                  width: 85.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(width: 1.0, color: AppColors.cyanNormal),
                  ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20),
              child: Text(
                t1,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.yellowDark,
                    fontSize: 18,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, top: 20),
              child: Text(
                t2,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.yellowDark,
                    fontSize: 18,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20),
              child: Text(
                t3,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.cyanLight,
                    fontSize: 18,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, top: 20),
              child: Text(
                t4,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.cyanLight,
                    fontSize: 18,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w400),
                    
              ),
            ),

          ],
        ),
         Container(
      height: 30.h,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount:t5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal:5.h,vertical: 1.h),
              child:
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                         border: Border.all(color: clr),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                      height: 4.h,
                      width: 35.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.h, top: 0.4.h,right: 2.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Text(
                                  'Aiswarya',
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  '7',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                   );
          }),),
      ]),
    );
  }
}
