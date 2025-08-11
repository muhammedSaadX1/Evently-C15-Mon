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
    this.maxLines = 1,
    this.controller,
    this.validator
  });

  final String? label;
  final String? hint;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color prefixIconColor;
  final int maxLines;

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator,
      controller: controller,
      style: Theme.of(context).textTheme.displayMedium,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,

        labelText: label,

        // prefixIconColor: prefixIconColor,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }
}
