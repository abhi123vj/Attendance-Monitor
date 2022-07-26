import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CreateSubject extends StatelessWidget {
  CreateSubject({Key? key}) : super(key: key);
  final _batchIdController = TextEditingController();
  final _semController = TextEditingController();
  final _subController = TextEditingController();
  final _subDesController = TextEditingController();
  final _teacherIdController = TextEditingController();
  final _subjectIndexController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Subject",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(3.h),
          child: Column( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5.h,),
             AppFormField(
                      controller: _batchIdController,
                      hintText: 'Batch Id',
                      type: 'normal',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppFormField(
                        type: "DropDown",
                        list: [
                          "S1",
                          "S2",
                          "S3",
                          "S4",
                          "S5",
                          "S6",
                          "S7",
                          "S8"
                        ],
                        controller: _semController,
                        hintText: 'Semester'),
                    SizedBox(
                      height: 10,
                    ),
                    AppFormField(
                      controller: _subController,
                      hintText: 'Subject Name',
                      type: 'name',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppFormField(
                      controller: _subDesController,
                      hintText: 'Subject Description',
                      type: 'normal',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppFormField(
                      controller: _teacherIdController,
                      hintText: 'Teacher Id',
                      type: 'normal',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppFormField(
                      controller: _subjectIndexController,
                      hintText: 'Subject Index',
                      type: 'normal',
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    ElevatedButton(
                              onPressed: () {
                               
                              },
                              child:Text(
                                      'Submit',
                                      style: Theme.of(context).textTheme.button,
                                    ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 3.w,horizontal: 8.h),
                                  primary: AppColors.bgBlack,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18)))),
                            )
            ]),
        ),
      ) 
    );
  }
}