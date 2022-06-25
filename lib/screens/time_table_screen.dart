import 'dart:developer';
import 'package:attendance_montior/controllers/timetable_controller.dart';
import 'package:attendance_montior/screens/time_table_upload_screen.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../controllers/suject_controller.dart';

class TimeTableScreen extends StatelessWidget {
  TimeTableScreen({Key? key}) : super(key: key);
  final TimeTableCOntroller timeC = Get.put(TimeTableCOntroller());

  @override
  Widget build(BuildContext context) {
    final _semController = TextEditingController();
    final _branchController = TextEditingController();
    final List _date = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Time Table",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [            
            Container(
              height: 60,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _date.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Bounce(
                        duration: const Duration(milliseconds: 110),
                        onPressed: () {
                          timeC.selectedIndex.value = index;
                        },
                        child: Obx(() => Container(
                              
                              width: 130,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20,),
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: timeC.selectedIndex.value == index
                                      ? AppColors.bgBlack
                                      : AppColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text(
                                _date[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                      color: timeC.selectedIndex.value == index
                                          ? AppColors.white
                                          : AppColors.bgBlack,
                                    ),
                              ),
                            )));
                  }),
            ),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))
                  ),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Material(
                    elevation: 3,
                     borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                    child: Container(
                                       
                    
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                           decoration: BoxDecoration(
                             color: AppColors.accentGreen,borderRadius:
                                          BorderRadius.only( topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                           ),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("9:00AM - 10:00AM",style: Theme.of(context)
                          .textTheme
                          .caption),
                                Text("S8 CSE",style: Theme.of(context)
                          .textTheme
                          .subtitle1),
                              ],
                            ),
                          ),
                           Container(                       
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Text("Graph Theory",style: Theme.of(context)
                          .textTheme
                          .headline6)),
                        ],
                      ),
                      decoration: BoxDecoration(
                         borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                        color: AppColors.white
                      ),
                    ),
                  ),
                );
                            }),
                          ))
          ],
        ));
  }
}
