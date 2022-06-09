import 'package:attendance_montior/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return GetMaterialApp(
      initialRoute: '/home',
      getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
    );
  }));
}
