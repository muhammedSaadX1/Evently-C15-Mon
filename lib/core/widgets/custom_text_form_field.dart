import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  final String label;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.inter(color: ColorsManager.black, fontSize: 18.sp, fontWeight: FontWeight.w400),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon:
            prefixIcon != null
                ? Icon(prefixIcon, color: ColorsManager.grey)
                : null,
        suffixIcon:
            suffixIcon != null
                ? Icon(suffixIcon, color: ColorsManager.grey)
                : null,
      ),
    );
  }
}
