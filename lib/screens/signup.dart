import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/home_screen.dart';
import 'package:attendance_montior/screens/login.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

import '../controllers/authentication_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpasswordController = TextEditingController();
  final _staffIdController = TextEditingController();
  final _deptIdController = TextEditingController();
    final _phnNoController = TextEditingController();

  AuthController authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackGlaze,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Material(
            child: Container(
              color: AppColors.blackGlaze,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 5.h, left: 5.h, bottom: 5.h, right: 5.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign up',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 22,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Welcome to UCEK Buzz',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      AppFormField(
                          controller: _nameController, hintText: 'Name'),
                      AppFormField(
                          controller: _staffIdController, hintText: 'Email Id'),
                             AppFormField(
                          controller: _phnNoController, hintText: 'Phone No'),
                      AppFormField(
                          type: "DropDown",
                          list: [
                            "CSE",
                            "ECE",
                            "IT",
                          ],
                          controller: _deptIdController,
                          hintText: 'Department'),
                      AppFormField(
                        controller: _passwordController,
                        hintText: 'Password',
                        type: 'password',
                      ),
                      AppFormField(
                        controller: _cpasswordController,
                        hintText: 'Confirm Password',
                        type: 'password',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.0.h),
                              child: ElevatedButton(
                                onPressed: () {
                                  authC.signUp(params: {
                                    "name": _nameController.text,
                                    "username": _staffIdController.text,
                                    "mobnumber": _phnNoController.text,
                                    "dept": _deptIdController.text,
                                    "role": "Tecaher",
                                    "password": _passwordController.text
                                  });
                                },
                                child: Text(
                                  'Signup',
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
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5.h,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Text(
                              'Already has an account?',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 15,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: Text(
                              'login',
                              style: TextStyle(
                                color: AppColors.cyanDark,
                                fontSize: 15,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
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
