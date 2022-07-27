import 'package:attendance_montior/models/attendence_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';

class AttdncReport extends StatefulWidget {
  AttdncReport({Key? key}) : super(key: key);

  @override
  State<AttdncReport> createState() => _AttdncReportState();
}

class _AttdncReportState extends State<AttdncReport> {
  final List attendance = Get.arguments[1];

  final List dateObj = Get.arguments[2];
  String displayMsg = "";
  @override
  void initState() {
    setState(() {
      displayMsg = "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments[0],
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold)
              .copyWith(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.bgBlack,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            width: 100.w,
            height: 30.h,
            decoration: BoxDecoration(color: AppColors.white),
            child:
                Text(displayMsg, style: Theme.of(context).textTheme.subtitle1),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Wrap(
                children: List.generate(
                    Get.arguments[1].length,
                    (index) => Bounce(
                          duration: const Duration(milliseconds: 110),
                          onPressed: () {
                            setState(() {
                              displayMsg =
                                  Get.arguments[2].elementAt(index).notes;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Get.arguments[1].elementAt(index) == 1
                                    ? AppColors.accentGreen
                                    : AppColors.redPastel),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    DateFormat('dd-MM')
                                        .format(dateObj.elementAt(index).date),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.copyWith(fontWeight: FontWeight.w600)),
                                Text(dateObj.elementAt(index).period.toString(),
                                    style: Theme.of(context).textTheme.button),
                              ],
                            ),
                          ),
                        )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
