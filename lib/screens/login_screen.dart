import 'dart:developer';
import 'package:attendance_montior/routes/app_routes.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/controllers/authentication_controller.dart';
import 'package:attendance_montior/network/repo/app_auth.dart';
import 'package:attendance_montior/screens/signup_screen.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  AuthController authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Get.arguments != null ? _emailController.text = Get.arguments : "";
    _emailController.text = "admin@admin.com";
    _passwordController.text = "123456";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(left: 5.h, right: 5.h),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Login In',
                // style: const TextStyle(
                //   fontSize: 22,
                //   letterSpacing: 1,
                //   fontWeight: FontWeight.w800,
                // ),
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'Welcome to Admin',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 5.h,
              ),
              AppFormField(controller: _emailController, hintText: 'Staff ID'),
              const SizedBox(
                height: 10,
              ),
              AppFormField(
                type: 'password',
                controller: _passwordController,
                hintText: 'Password',
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(() => ElevatedButton(
                          onPressed: () {
                            log("message");
                            if (authC.isloading.isFalse) {
                              log("message2");
                              authC.login(params: {
                                "email": _emailController.text,
                                "password": _passwordController.text
                              });
                            }
                          },
                          child: authC.isloading.isTrue
                              ? JumpingText(
                                  'Loading...',
                                  style: Theme.of(context).textTheme.button,
                                )
                              : Text(
                                  'Login',
                                  style: Theme.of(context).textTheme.button,
                                ),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 5.w),
                              primary: AppColors.bgBlack,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)))),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      'Don\'t have an account?',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.signUpScreen);
                    },
                    child: Text(
                      'SignUp',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ]),
      ),
    );
  }
}
