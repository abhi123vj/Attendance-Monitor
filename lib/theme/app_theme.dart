import 'package:attendance_montior/theme/apptext_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import 'appbar_theme.dart';

class AppTheme {
  static final theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.cyanNormal,
      backgroundColor: AppColors.bgWhite,
      canvasColor: AppColors.bgWhite,
      scaffoldBackgroundColor: AppColors.bgWhite,
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding:  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20)),
              foregroundColor: MaterialStateProperty.all<Color>(
        AppColors.bgBlack,
      ))),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: AppTextTheme.textTheme,
      appBarTheme: CustomAppBarTheme.theme, 
      textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.cyanDark));
}
