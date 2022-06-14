import 'dart:developer';

import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../controllers/suject_controller.dart';

class TimetableCreateScreen extends StatefulWidget {
  const TimetableCreateScreen({Key? key}) : super(key: key);

  @override
  State<TimetableCreateScreen> createState() => _TimetableCreateScreenState();
}

class _TimetableCreateScreenState extends State<TimetableCreateScreen> {
  String? _selectedTime1;
   String? _selectedTime2;
  Future<void> _show1() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime1 = result.format(context);
      });
    }
  }
   Future<void> _show2() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime2 = result.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _semController = TextEditingController();
    final _branchController = TextEditingController();
    final _subController = TextEditingController();
    final _sub1Controller = TextEditingController();
    final _sub2Controller = TextEditingController();
    final _sub3Controller = TextEditingController();
    final _sub4Controller = TextEditingController();
    final _sub5Controller = TextEditingController();
    final _sub6Controller = TextEditingController();
    //int val =int.parse(_subController.text); 
    List<String> sem = ['S1', 'S2', 'S3', 'S4', 'S5', 'S6', 'S7', 'S8'];
    List<String> branch = ['CSE', 'EC', 'IT'];
    final List<Map> date = [
      {'index': 1, 'date': 'Mon'},
      {'index': 2, 'date': 'Tue'},
      {'index': 3, 'date': 'Wed'},
      {'index': 4, 'date': 'Thu'},
      {'index': 5, 'date': 'Fri'},
    ].toList();
    final List<Map> Controller = [
      {'index': 1, 'Controller': _sub1Controller},
      {'index': 2, 'Controller': _sub2Controller},
      {'index': 2, 'Controller': _sub3Controller},
      {'index': 3, 'Controller': _sub4Controller},
      {'index': 4, 'Controller': _sub5Controller},
      {'index': 5, 'Controller': _sub6Controller},
    ].toList();
    late int selectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Create Time Table",
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
                      controller: _branchController),
                  AppFormField(
                      type: 'Number',
                      hintText: "No. of subjects",
                      controller: _subController)
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
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 120.h,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 6,
                  //itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.cyanNormal,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 1.h, top: 0.4.h, right: 1.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  AppFormField(
                                    type: "Normal",
                                    hintText: "Subject Name",
                                    controller: Controller[index]['Controller'],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                          child: FittedBox(
                                            child: Text(
                                              _selectedTime1 != null
                                                  ? _selectedTime1!
                                                  : 'No time selected!',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  letterSpacing: 0.15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          onTap: _show1),
                                      Text(
                                        '\t-\t',
                                        style: TextStyle(
                                            fontSize: 15,
                                            letterSpacing: 0.15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      InkWell(
                                          child: FittedBox(
                                            child: Text(
                                              _selectedTime2 != null
                                                  ? _selectedTime2!
                                                  : 'No time selected!',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  letterSpacing: 0.15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          onTap: _show2),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
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
