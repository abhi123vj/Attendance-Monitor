import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/home_screen.dart';
import 'package:attendance_montior/screens/signup.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                    top: 15.h, left: 5.h, bottom: 26.9.h, right: 5.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login In',
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
                          controller: _emailController,
                          hintText: 'Staff Id'),
                      AppFormField(
                        controller: _passwordController,
                        hintText: 'Password',
                        type: 'password',
                      ),
                      // Container(
                      //   alignment: Alignment.topRight,
                      //   child: InkWell(
                      //     child: Text(
                      //       'Forgot Password',
                      //       textAlign: TextAlign.right,
                      //       style: TextStyle(
                      //         color: AppColors.white,
                      //         fontSize: 16,
                      //         letterSpacing: 1,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //     onTap: () {

                      //     },
                      //   ),
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsets.only(top: 5.0.h),
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(HomeScreen());

                                },
                                child: Text(
                                  'Login',
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
                                'Don\'t have an account?',
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
                               Get.to(SignUpScreen());
                              },
                              child: Text(
                               'Create account',
                                style: TextStyle(
                                  color: AppColors.cyanDark,
                                  fontSize: 15,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],),
                    ]),
              ),
            ),
          ),
        )
        ,
      ),);
  }

}