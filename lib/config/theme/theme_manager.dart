import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeManager{
  static final ThemeData light= ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.whiteBlue,
      foregroundColor: ColorsManager.black1C,
      titleTextStyle: GoogleFonts.roboto(fontSize: 22.sp, color: ColorsManager.black1C,fontWeight: FontWeight.w400)
    ,centerTitle: true,
    ),
    scaffoldBackgroundColor: ColorsManager.whiteBlue,
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),

          borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),

          borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),

          borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: REdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r)
      ),
      foregroundColor: ColorsManager.white,
      backgroundColor: ColorsManager.blue,
      textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500, color: ColorsManager.white)
  ),
  ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          textStyle: TextStyle(color: ColorsManager.blue, fontSize: 16.sp,fontWeight: FontWeight.bold,decoration: TextDecoration.underline, fontStyle: FontStyle.italic),
          foregroundColor: ColorsManager.blue),

    )

  );
  static final ThemeData dark= ThemeData();
}