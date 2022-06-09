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
                      fontSize: 34,
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
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                      margin: EdgeInsets.all(10.0),
                      width: 85.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 2.0, color: AppColors.white),
                      ),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, top: 20),
                              child: Text(
                                "present ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.cyanLight,
                                    fontSize: 23,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30.0, top: 20),
                              child: Text(
                                "35 ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.cyanLight,
                                    fontSize: 23,
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
                              padding:
                                  const EdgeInsets.only(left: 30.0, top: 20),
                              child: Text(
                                "name ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.cyanLight,
                                    fontSize: 23,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30.0, top: 20),
                              child: Text(
                                "roll.no ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.cyanLight,
                                    fontSize: 23,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        // Expanded(
                        //     child: ListView.builder(
                        //         itemCount: 35 + 1,
                        //         itemBuilder: (cntx, index) {
                        //           final TextEditingController textController =
                        //               TextEditingController();
                        //           if (index == 45) {
                        //             return Row(children: [
                        //               Expanded(
                        //                 child: Padding(
                        //                   padding: EdgeInsets.symmetric(
                        //                       horizontal: 5.0.h),
                        //                   child: ElevatedButton(
                        //                     onPressed: () {},
                        //                     child: Text(
                        //                       'Upload',
                        //                       style: TextStyle(
                        //                           fontSize: 17,
                        //                           fontWeight: FontWeight.w500),
                        //                     ),
                        //                     style: ElevatedButton.styleFrom(
                        //                         padding: EdgeInsets.symmetric(
                        //                             vertical: 4.w),
                        //                         primary: AppColors.cyanDark,
                        //                         shape: const StadiumBorder()),
                        //                   ),
                        //                 ),
                        //               ),
                        //             ]);
                        //           }
                        //         }))
                      ]))),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                      margin: EdgeInsets.all(10.0),
                      width: 85.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 2.0, color: AppColors.white),
                      ),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, top: 20),
                              child: Text(
                                "Abscence ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.cyanLight,
                                    fontSize: 23,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30.0, top: 20),
                              child: Text(
                                "10 ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.cyanLight,
                                    fontSize: 23,
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
                              padding:
                                  const EdgeInsets.only(left: 30.0, top: 20),
                              child: Text(
                                "name ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.cyanLight,
                                    fontSize: 23,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 30.0, top: 20),
                              child: Text(
                                "roll.no ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColors.cyanLight,
                                    fontSize: 23,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        // Expanded(
                        //     child: ListView.builder(
                        //         itemCount: 35 + 1,
                        //         itemBuilder: (cntx, index) {
                        //           final TextEditingController textController =
                        //               TextEditingController();
                        //           if (index == 45) {
                        //             return Row(children: [
                        //               Expanded(
                        //                 child: Padding(
                        //                   padding: EdgeInsets.symmetric(
                        //                       horizontal: 5.0.h),
                        //                   child: ElevatedButton(
                        //                     onPressed: () {},
                        //                     child: Text(
                        //                       'Upload',
                        //                       style: TextStyle(
                        //                           fontSize: 17,
                        //                           fontWeight: FontWeight.w500),
                        //                     ),
                        //                     style: ElevatedButton.styleFrom(
                        //                         padding: EdgeInsets.symmetric(
                        //                             vertical: 4.w),
                        //                         primary: AppColors.cyanDark,
                        //                         shape: const StadiumBorder()),
                        //                   ),
                        //                 ),
                        //               ),
                        //             ]);
                        //           }
                        //         }))
                      ])))
            ]),
          )
        ])));
  }
}
