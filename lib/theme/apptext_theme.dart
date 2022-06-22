import 'package:attendance_montior/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static final  textTheme = TextTheme(
    
    headline1: GoogleFonts.robotoMono(
      
    fontSize: 92,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5
  ),
 
  headline2: GoogleFonts.robotoMono(
    fontSize: 57,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5
  ),
  headline3: GoogleFonts.robotoMono(
    fontSize: 46,
    fontWeight: FontWeight.w400
  ),
  headline4: GoogleFonts.robotoMono(
    color: AppColors.bgBlack,
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25
  ),
  headline5: GoogleFonts.robotoMono(
    fontSize: 23,
    fontWeight: FontWeight.w400
  ),
  headline6: GoogleFonts.robotoMono(
    fontSize: 19,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2
  ),

  subtitle1: GoogleFonts.robotoMono(
        color: AppColors.bgBlack,

    fontSize: 15,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.5
  ),
  subtitle2: GoogleFonts.robotoMono(

    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: .5
  ),
  bodyText1: GoogleFonts.robotoMono(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5
  ),
  bodyText2: GoogleFonts.robotoMono(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25
  ),
  button: GoogleFonts.robotoMono(
        color: AppColors.white,

    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2
  ),
  caption: GoogleFonts.robotoMono(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4
  ),
  overline: GoogleFonts.robotoMono(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5
  ),
  );

}