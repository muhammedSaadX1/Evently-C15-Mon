import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category,
    required this.selectedBackgroundColor, required this.unSelectedBackgroundColor,
    required this.selectedForegroundColor, required this.unSelectedForegroundColor,
    required this.isSelected
  });

  final CategoryModel category;
  final Color selectedBackgroundColor;
  final Color unSelectedBackgroundColor;
  final Color selectedForegroundColor;
  final Color unSelectedForegroundColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: ColorsManager.whiteBlue, width: 1.w),
          color: isSelected ? selectedBackgroundColor : unSelectedBackgroundColor
      ),
      child: Row(
        children: [
          Icon(category.icon, color: isSelected ? selectedForegroundColor : unSelectedForegroundColor,),
          SizedBox(width: 8.w,),
          Text(category.name, style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: isSelected ? selectedForegroundColor: unSelectedForegroundColor),)
        ],
      ),
    );
  }
}
