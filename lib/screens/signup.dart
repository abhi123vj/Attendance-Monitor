import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/controllers/auth_controller.dart';
import 'package:attendance_montior/routes/app_routes.dart';
import 'package:attendance_montior/screens/home_screen.dart';

import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpasswordController = TextEditingController();
  final _staffIdController = TextEditingController();
  final _deptIdController = TextEditingController();
  final _phnNoController = TextEditingController();
  final _rollNoController = TextEditingController();
  final _yearController = TextEditingController();
  final AuthController authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 5.h, right: 5.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Sign up',
            style:Theme.of(context)
                          .textTheme
                          .headline5
          ),
          Text(
            'Welcome to UCEK Buzz',
            style:Theme.of(context)
                          .textTheme
                          .headline6
          ),
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  AppFormField(controller: _nameController, hintText: 'Name'),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    controller: _staffIdController,
                    hintText: 'Email Id',
                    type: 'email',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    controller: _phnNoController,
                    hintText: 'Phone No',
                    type: 'phone',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    controller: _rollNoController,
                    hintText: 'Roll No.',
                    type: 'number',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                      type: "DropDown",
                      list: [
                        "2018",
                        "2019",
                        "2020",
                        "2021",
                        "2022",
                        "2023",
                        "2024",
                        "2025"
                      ],
                      controller: _yearController,
                      hintText: 'Year of joining'),
                  // AppFormField(
                  //   controller: _yearController,
                  //   hintText: 'Year of joining',
                  //   type: 'number',
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                      type: "DropDown",
                      list: [
                        "CSE",
                        "ECE",
                        "IT",
                      ],
                      controller: _deptIdController,
                      hintText: 'Department'),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    controller: _passwordController,
                    hintText: 'Password',
                    type: 'Password',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    controller: _cpasswordController,
                    hintText: 'Confirm Password',
                    type: 'Password',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => ElevatedButton(
                              onPressed: () {
                                authC.signUp(params: {
                                  "name": _nameController.text,
                                  "email": _staffIdController.text,
                                  "mobnumber": _phnNoController.text,
                                  "dept": _deptIdController.text,
                                  "batch": _yearController.text,
                                  "registernumber": _rollNoController.text,
                                  "role": "Student",
                                  "password": _passwordController.text,
                                  // "studentId":
                                  //     _yearController.text.characters.take(2) +
                                  //         _deptIdController.text.characters
                                  //             .take(2) +
                                  //         _rollNoController.text.characters
                                  //             .take(3),
                                });
                              },
                              child: authC.isloading.isTrue
                                  ? JumpingText(
                                      'Loading...',
                                      style: Theme.of(context).textTheme.button,
                                    )
                                  : Text(
                                      'Signup',
                                      style: Theme.of(context).textTheme.button,
                                    ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 5.w),
                                  primary: AppColors.cyanDark,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18)))),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          'Already has an account?',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
