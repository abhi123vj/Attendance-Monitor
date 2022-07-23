import 'dart:developer';

import 'package:attendance_montior/controllers/time_table_controller.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../controllers/suject_controller.dart';

class TimeTableScreen extends StatelessWidget {
 TimeTableScreen({Key? key}) : super(key: key);
TimeTableCOntroller timeC = Get.put(TimeTableCOntroller());
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
          style:Theme.of(context)
                          .textTheme
                          .headline5
          
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Padding(
            //   padding:  EdgeInsets.symmetric(horizontal: 3.h),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       SizedBox(
            //   height: 2.h,
            // ),
            //       AppFormField(
            //           type: "DropDown",
            //           hintText: "Semester",
            //           list: sem,
            //           controller: _semController),
            //       //  _semController.text.isNotEmpty
            //       AppFormField(
            //           type: "DropDown",
            //           hintText: "Branch",
            //           list: branch,
            //           controller: _branchController)
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 1.h,
            // ),
           Container(
              height: MediaQuery.of(context).size.height * 0.12,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Obx(() => Padding(
                    padding: EdgeInsets.all(1.h),
                    child: TextButton(
                        child: Container(
                        
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                child: Text(
                                  date[index]['date'],
                                  style:Theme.of(context)
                          .textTheme
                          .headline6
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          timeC.selectedIndex.value = index;
                        },
                        style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(timeC.selectedIndex.value == index
                                                  ? Colors.yellow
                                                  : AppColors.cyanNormal,) ,
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                        side: BorderSide(
                                          color:
                                              timeC.selectedIndex.value == index
                                                  ? Colors.yellow
                                                  : AppColors.cyanNormal,
                                        ))))),
                  ));
                },
                itemCount: date.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
           
             Container(height:78.h,
               child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.orangeDark),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  width: double.infinity,
                  height: 14.5.h,
                  child: Column(children: [
                    SizedBox(height: 0.5.h,),
                   table_row('Start Time', '9:00am'),
                   table_row('End Time', "10:00am"),
                   table_row('Subject', "CSA"),
                   table_row('Teacher', "Manu")
                  ]),
              ),
            );
          }),
             ),
         
          ],
        ),
      ),
    );
  }

  Widget table_row(t1, t2) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 0.5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(t1), Text(t2)],
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
          Text(
            t2,
            style: TextStyle(
              color: AppColors.yellowPale,
              fontSize: 16,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
