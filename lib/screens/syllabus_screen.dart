import 'dart:async';
import 'dart:developer';

import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../controllers/suject_controller.dart';
import '../models/syllabus_res.dart';

class SyllabusScreen extends StatelessWidget {
  const SyllabusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubjectController subC = Get.put(SubjectController());
    final _searchKey = TextEditingController();
    Timer? searchOnStoppedTyping;
    subC.getSujects();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Syllabus",
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
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  style: Theme.of(context).textTheme.subtitle1,
                  controller: _searchKey,
                  maxLines: 1,
                  onChanged: (str) {
                    const duration = Duration(milliseconds: 800);
                    if (searchOnStoppedTyping != null) {
                      searchOnStoppedTyping?.cancel();
                    }
                    searchOnStoppedTyping = Timer(duration, () {
                      if (subC.searchKey.value != str.trim()) {
                        subC.searchKey.value = str.trim();
                        subC.getSujects();
                      }
                    });
                  },
                  decoration: InputDecoration(
                      focusColor: AppColors.cyanDark,
                      prefixIconColor: AppColors.bgWhite,
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: AppColors.bgBlack.withOpacity(.7)),
                      hintText: "Search.."),
                )),
            Expanded(
                child: Obx(() => subC.isloading.isTrue
                    ? Center(
                        child: LoadingAnimationWidget.dotsTriangle(
                          size: 50,
                          color: AppColors.accentGreen,
                        ),
                      )
                    : subC.syllabusList.length == 0
                        ? Center(child: Text("NO data"))
                        : ListView.builder(
                            itemCount: subC.syllabusList.length,
                            itemBuilder: ((context, index) {
                              SyllabusElement demoSyllbus =
                                  subC.syllabusList.elementAt(index);

                              ///! Redesign
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.accentGreen,
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: Offset(0,
                                              4), // changes position of shadow
                                        ),
                                      ],
                                      color: AppColors.bgWhite,
                                      border: Border.all(
                                          color: AppColors.orangeDark),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0)),
                                    ),
                                    width: double.infinity,
                                    height: 14.5.h,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //SizedBox(height: 0.5.h,),
                                            table_row('Semester',
                                                '${demoSyllbus.semester}'),

                                            table_row('Department',
                                                "${demoSyllbus.dept}"),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            table_row('Scheme',
                                                "${demoSyllbus.scheme} "),
                                                SizedBox(width: 6.h,),
                                            Padding(
                                              padding:  EdgeInsets.only(right:2.h),
                                              child: Text(
                                                "View",
                                                style: TextStyle(
                                                    color: AppColors.yellowDark),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ));
                            }))))
          ],
        ));
  }

  Widget table_row(t1, t2) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 0.5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(t1),
          Text('\t:\t'),
          Text(
            t2,
            style: TextStyle(color: AppColors.cyanDark, fontSize: 20),
          )
        ],
      ),
    );
  }
}
//${index + 1}) 