import 'dart:developer';

import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../controllers/suject_controller.dart';

class TimeTableScreen extends StatelessWidget {
  const TimeTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _semController = TextEditingController();
    final _branchController = TextEditingController();
    List<String> sem = ['S1', 'S2', 'S3', 'S4', 'S5', 'S6', 'S7', 'S8'];
    List<String> branch = ['CSE', 'EC', 'IT'];
    final List<Map> date = [
      {'index': 2, 'date': 'Mon'},
      {'index': 3, 'date': 'Tue'},
      {'index': 4, 'date': 'Wed'},
      {'index': 5, 'date': 'Thu'},
      {'index': 6, 'date': 'Fri'},
    ].toList();
    late int selectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Time Table",
          style: TextStyle(
              fontSize: 20, letterSpacing: 0.15, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppFormField(
                      type: "DropDown",
                      hintText: "Semester",
                      list: sem,
                      controller: _semController),
                  //  _semController.text.isNotEmpty
                  AppFormField(
                      type: "DropDown",
                      hintText: "Branch",
                      list: branch,
                      controller: _branchController)
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0)),
                  color: AppColors.blackGlaze,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 10),
                        color: AppColors.black)
                  ]),
            ),
            SizedBox(height: 3.h,),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                      child: Padding(
                          padding: EdgeInsets.all(0.7.h),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: Text(
                                    date[index]['date'],
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 18,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedIndex == index
                                    ? Colors.yellowAccent
                                    : AppColors.cyanNormal,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            width: 9.0.h,
                            height: 11.5.h,
                          )),
                      onTap: () {
                        {
                          selectedIndex = index;
                        };
                      });
                },
                itemCount: date.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            table('9:00-10:00 am', 'Maths'),
            table('10:00-11:00 am', 'Physics'),
            table('11:00-12:00 pm', 'Chem'),
            table('1:00-2:00 pm', 'Maths'),
            table('2:00-3:00 pm', 'Physics'),
            table('3:00-4:00 pm', 'Chem'),
          ],
        ),
      ),
    );
  }

  Widget table(t1, t2) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
      child: Row(
        children: [
          Text(
            t1,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              letterSpacing: 1,
            ),
          ),
          Expanded(child: Container()),
          Text(t2,style: TextStyle(
              color: AppColors.yellowPale,
              fontSize: 16,
              letterSpacing: 1,
            ),),
        ],
      ),
    );
  }
}
