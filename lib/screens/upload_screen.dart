import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

class UploadScreen extends StatelessWidget {
  UploadScreen({Key? key}) : super(key: key);
  final TextEditingController hour = TextEditingController();
  final TextEditingController topic = TextEditingController();
  final TextEditingController remark = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " ",
          style: TextStyle(
              fontSize: 20, letterSpacing: 0.15, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: AppColors.blackGlaze,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Material(
            child: Container(
              color: AppColors.blackGlaze,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 1.h, left: 5.h, bottom: 5.h, right: 5.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Absenties',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 22,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.cyanLight),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          //color: AppColors.white,
                        ),
                        width: double.infinity,
                        height: 15.5.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(
                            '1,2,3,4,5,6,7,8,9,15,46,23,45,43,42,41,36,37,38',
                            style: TextStyle(fontSize: 20),
                            maxLines: 6,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      AppFormField(
                          hintText: " hour",
                          type: 'DropDown',
                          controller: hour,
                          list: [
                            '1st hour',
                            '2nd hour',
                            '3rd hour',
                            '4th hour',
                            '5th hour',
                            '6th hour',
                          ]),
                     
                      AppFormField(
                          controller: topic,
                          maxLines: 4,
                          height: 11.h,
                          hintText: 'Topics'),
                     
                      AppFormField(
                          controller: remark,
                          maxLines: 4,
                          height: 14.h,
                          hintText: 'Remark'),
                      
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 2.0.h),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Upload',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                style: ElevatedButton.styleFrom(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.w),
                                    primary: AppColors.cyanDark,
                                    shape: const StadiumBorder()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
