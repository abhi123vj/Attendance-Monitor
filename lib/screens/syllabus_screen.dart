import 'dart:async';
import 'dart:developer';

import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
                    searchOnStoppedTyping =  Timer(duration, () {
                      if(subC.searchKey.value != str.trim()){subC.searchKey.value = str.trim();
                      subC.getSujects();}
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
                              return Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                    "${index + 1}) ${demoSyllbus.semester}  ${demoSyllbus.dept}  Scheme ${demoSyllbus.scheme} "),
                              );
                            }))))
          ],
        ));
  }
}
