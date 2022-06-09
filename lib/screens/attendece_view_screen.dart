import 'dart:developer';

import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AttendenceReview extends StatelessWidget {
  const AttendenceReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Column(children: [
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
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: 85.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(width: 1.0, color: AppColors.cyanLight),
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 20),
                          child: Text(
                            "Present ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.cyanNormal,
                                fontSize: 18,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0, top: 20),
                          child: Text(
                            "35 ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.cyanNormal,
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
                          padding: const EdgeInsets.only(
                              left: 30.0, top: 10, bottom: 20),
                          child: Text(
                            "Absent ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.cyanNormal,
                                fontSize: 18,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 30.0, top: 10, bottom: 20),
                          child: Text(
                            "10 ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: AppColors.cyanNormal,
                                fontSize: 23,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 185),
                      child: TextButton(
                          onPressed: null,
                          child: Row(
                            children: [
                              Text("view in detial"),
                              Icon(Icons.keyboard_double_arrow_down_outlined)
                            ],
                          )),
                    )
                  ]),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 30),
                  child: Text(
                    "Topics ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: AppColors.cyanLight,
                        fontSize: 22,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ]),
              Container(
                margin: EdgeInsets.all(8.0),
                height: 10.h,
                width: 85.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(width: 1.0, color: AppColors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Topics coverd are",
                        style: TextStyle(color: AppColors.cyanDark, fontSize: 18),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 20),
                    child: Text(
                      "Remarks ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: AppColors.cyanLight,
                          fontSize: 22,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                height: 10.h,
                width: 85.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(width: 1.0, color: AppColors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Remarks of the the current class are",
                        style: TextStyle(color: AppColors.cyanDark, fontSize: 18),
                      )),
                ),
              ),
            ],
          ))
        ]));
  }
}
