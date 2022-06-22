import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomAppBarTheme {
  static const theme = AppBarTheme(
    
    titleTextStyle: TextStyle(
      color: AppColors.bgBlack
    ),
    iconTheme: IconThemeData(
      color: AppColors.bgBlack
    ),
    color: Colors.transparent,
    elevation: 0
  );
}