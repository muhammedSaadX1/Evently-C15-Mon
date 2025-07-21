import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeManager{
  static final ThemeData light= ThemeData(
      dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: GoogleFonts.inter(color: ColorsManager.white, fontSize: 14.sp, fontWeight: FontWeight.w500),
          menuStyle: MenuStyle(backgroundColor: WidgetStateProperty.all(ColorsManager.darkBlue),  )
      ),
    primaryColor: ColorsManager.blue,
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.whiteBlue,
      foregroundColor: ColorsManager.black1C,
      titleTextStyle: GoogleFonts.roboto(fontSize: 22.sp, color: ColorsManager.black1C,fontWeight: FontWeight.w400)
    ,centerTitle: true,
    ),
    scaffoldBackgroundColor: ColorsManager.whiteBlue,
    bottomAppBarTheme: BottomAppBarTheme(
      color: ColorsManager.blue,
      shape: CircularNotchedRectangle()
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.white
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.blue,
      shape: StadiumBorder(
          side: BorderSide(color: ColorsManager.white, width: 4)
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor:ColorsManager.grey
        ,
      suffixIconColor: ColorsManager.grey,
      hintStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.grey,
      ) ,

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

          borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
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

    ),
    iconTheme: IconThemeData(
      color: ColorsManager.black,

    ),
    //cardColor: ColorsManager.whiteBlue,
      cardTheme: CardTheme(
        color: ColorsManager.whiteBlue,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.white,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      displayMedium: GoogleFonts.inter(fontSize: 16, color: ColorsManager.black),
      bodySmall: GoogleFonts.inter(color: ColorsManager.black1C, fontWeight: FontWeight.bold, fontSize: 14.sp),
      labelMedium: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorsManager.black1C),
      labelSmall: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue),
displaySmall: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue
)
    )

  );
  static final ThemeData dark= ThemeData(
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: GoogleFonts.inter(color: ColorsManager.ofWhite, fontSize: 14.sp, fontWeight: FontWeight.w500),
      menuStyle: MenuStyle(backgroundColor: WidgetStateProperty.all(ColorsManager.darkBlue),  )
    ),
    primaryColor: ColorsManager.darkBlue,
      useMaterial3: false,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.darkBlue,
        foregroundColor: ColorsManager.blue,
        titleTextStyle: GoogleFonts.roboto(fontSize: 22.sp,color: ColorsManager.blue,fontWeight: FontWeight.w400)
        ,centerTitle: true,
      ),
      scaffoldBackgroundColor: ColorsManager.darkBlue,
      bottomAppBarTheme: BottomAppBarTheme(
          color: ColorsManager.darkBlue,
          shape: CircularNotchedRectangle()
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorsManager.ofWhite,
          unselectedItemColor: ColorsManager.ofWhite
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.darkBlue,
        shape: StadiumBorder(
            side: BorderSide(color: ColorsManager.ofWhite, width: 4)
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: ColorsManager.ofWhite,
          suffixIconColor: ColorsManager.ofWhite,
          hintStyle: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.blue,
          ) ,

          labelStyle: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.ofWhite,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),

            borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
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

      ),
      iconTheme: IconThemeData(
        color: ColorsManager.ofWhite,

      ),
      //cardColor: ColorsManager.ofWhite,
      cardTheme: CardTheme(
        color: ColorsManager.darkBlue,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),

      textTheme: TextTheme(
        titleSmall: GoogleFonts.inter(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorsManager.ofWhite,
        ),
          displayMedium: GoogleFonts.inter(fontSize: 16, color: ColorsManager.ofWhite),

          titleMedium: GoogleFonts.inter(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.ofWhite,
        ),
          bodySmall: GoogleFonts.inter(color: ColorsManager.ofWhite, fontWeight: FontWeight.bold, fontSize: 14.sp),

          labelMedium: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorsManager.ofWhite),
        labelSmall: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue),
  displaySmall: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorsManager.darkBlue)

      )

  );
}