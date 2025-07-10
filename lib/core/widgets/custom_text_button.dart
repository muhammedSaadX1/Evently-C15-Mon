import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: ColorsManager.blue),
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: ColorsManager.blue, fontSize: 16.sp,fontWeight: FontWeight.bold,decoration: TextDecoration.underline, fontStyle: FontStyle.italic),
      ),
    );
  }
}
