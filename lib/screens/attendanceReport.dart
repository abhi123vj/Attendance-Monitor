import 'package:attendance_montior/models/attendence_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/app_colors.dart';

class AttdncReport extends StatelessWidget {
  AttdncReport({Key? key}) : super(key: key);
  final List attendance = Get.arguments[1];
  final List dateObj = Get.arguments[2];
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
      body: Center(
          child: Wrap(
        children: List.generate(
            Get.arguments[1].length,
            (index) => Container(
              padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Get.arguments[1].elementAt(index) == 1
                          ? AppColors.accentGreen
                          : AppColors.accentYellow),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(DateFormat('dd-MM')
                          .format(dateObj.elementAt(index).date), style: Theme.of(context)
                .textTheme
                .subtitle2?.copyWith(fontWeight: FontWeight.w600)),
                          Text(dateObj.elementAt(index).period.toString(), style: Theme.of(context)
                .textTheme
                .button),
                    ],
                  ),
                )),
      )),
    );
  }
}
