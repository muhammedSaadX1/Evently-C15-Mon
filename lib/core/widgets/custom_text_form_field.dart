import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
     this.label,
    this.prefixIcon,
    this.prefixIconColor = ColorsManager.grey,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.hint,
  });

  final String?label;
  final String? hint;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.inter(color: ColorsManager.black, fontSize: 18.sp, fontWeight: FontWeight.w400),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,

        labelText: label,

        prefixIcon:
            prefixIcon != null
                ? Icon(prefixIcon, color:prefixIconColor)
                : null,
        suffixIcon:
            suffixIcon != null
                ? Icon(suffixIcon, color: ColorsManager.grey)
                : null,
      ),
    );
  }
}
