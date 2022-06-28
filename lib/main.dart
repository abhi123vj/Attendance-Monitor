import 'dart:developer';

import 'package:attendance_montior/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return GetMaterialApp(
      initialRoute: AppRoutes.initialPage,
      getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
    );
  }));
}
