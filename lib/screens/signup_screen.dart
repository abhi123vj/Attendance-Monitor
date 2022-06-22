import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/home_screen.dart';
import 'package:attendance_montior/screens/login_screen.dart';
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
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'Welcome to UCEK Buzz',
            style: Theme.of(context).textTheme.headline6,
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
                    type: 'password',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppFormField(
                    controller: _cpasswordController,
                    hintText: 'Confirm Password',
                    type: 'password',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
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
                            style: Theme.of(context).textTheme.button,
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 5.w),
                              primary: AppColors.bgBlack,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
