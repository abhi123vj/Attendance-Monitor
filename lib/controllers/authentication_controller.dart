import 'dart:developer';

import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/models/base_res.dart';
import 'package:attendance_montior/models/login_res.dart';
import 'package:attendance_montior/network/repo/app_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  login({required Map params}) async {
    var res = await AuthRepo.userLogin(params: params);
    log("first ${res}");
    if (res.success == true) {
      res as LoginResponse;
      Get.offAllNamed("/", arguments:res.user);
      log("Receds ${res.user?.name}");
    } else {
      res as BaseResponse;
      Get.snackbar("Login Failed", res.message.toString(),colorText: AppColors.cyanLight);
      log("Receds fail  ${res.message}");
    }
  }
}
