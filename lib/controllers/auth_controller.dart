import 'dart:developer';

import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/models/base_response.dart';
import 'package:attendance_montior/models/login_response.dart';
import 'package:attendance_montior/models/signup_response.dart';

import 'package:attendance_montior/network/repo/app_auth.dart';
import 'package:attendance_montior/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/user_session.dart';

class AuthController extends GetxController {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  RxBool isloading = false.obs;
  login({required Map params}) async {
    isloading.value = true;
    var res = await AuthRepo.userLogin(params: params);
    log("first ${res}");
    if (res.success == true) {
      res as LoginResponse;
      saveUserSession(res);
      Get.offAllNamed("/", arguments: res.user);
      log("Receds ${res.user?.name}");
    } else {
      res as BaseResponse;
      Get.snackbar("Login Failed", res.message.toString());
      log("Receds fail  ${res.message}");
    }
    isloading.value = false;
  }

  void saveUserSession(LoginResponse session) {
    if (session.token != null) {
      final tokens = session.token;
      final user = session.user;
      if (tokens != null && user != null) {
        UserSession().saveTokens(tokens);
        UserSession().saveUser(user);
        UserSession().tokens = tokens;
        UserSession().user = user;
      }
    }
  }

  signUp({required Map params}) async {

   params[ "studentId"]=  params["batch"].toString().substring(2,4)+params["dept"].toString()+params["registernumber"].toString().substring(params["registernumber"].toString().length-4,params["registernumber"].toString().length);

     isloading.value = true;
      var res = await AuthRepo.userSignUp(params: params);
     res as BaseResponse;
      log("first ${res}");
            Get.snackbar(
          "Sign Up Compleated!",
          res.message.toString(),
        );  
 Get.offAllNamed(AppRoutes.loginScreen);
    isloading.value = false;
  }
}
