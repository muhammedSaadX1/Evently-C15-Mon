import 'dart:developer';

import 'package:evently_c15_mon/core/assets_manager.dart';
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

typedef OnChange = void Function(String?);

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectedTheme = "Light";
  String selectedLang = "English";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: REdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorsManager.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.r),
              ),
            ),
            child: Row(
              children: [
                Image.asset(ImageAssets.profile),
                SizedBox(width: 16.w),
                Column(
                  children: [
                    Text(
                      "Muhammed Saad",
                      style: GoogleFonts.inter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.white,
                      ),
                    ),
                    Text(
                      "mSaad@gmail.com",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: REdgeInsets.all(8.0),
            child: Column(
              children: [
                buildDropDown(
                  selectedItemView: selectedLang,
                  labelText: "Language",
                  menuItems: ["English", "عربي"],
                  onChange: (newLang) {
                   selectedLang = newLang!;
                   setState(() {

                   });
                  },
                ),
                SizedBox(height: 16.h),
                buildDropDown(
                  selectedItemView: selectedTheme,
                  labelText: "Theme",
                  menuItems: ["Light", "Dark"],
                  onChange: (newTheme) {
                   selectedTheme = newTheme!;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropDown({
    required String labelText,
    required String selectedItemView,
    required List<String> menuItems,
    required OnChange? onChange,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: Theme.of(context).textTheme.labelMedium),
        SizedBox(height: 8.h),
        SizedBox(
          height: 60.h,
          child: Container(
            padding: REdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: ColorsManager.blue, width: 1),
            ),
            child: Row(
              children: [
                Text(
                  selectedItemView,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Spacer(),
                DropdownButton<String>(
                  style: Theme.of(context).dropdownMenuTheme.textStyle,
                  dropdownColor: Theme.of(context).primaryColor,
                  underline: Container(),
                  items:
                      menuItems.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item,),
                        );
                      }).toList(),
                  onChanged: onChange,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
