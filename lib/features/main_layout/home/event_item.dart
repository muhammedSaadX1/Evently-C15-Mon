import 'package:evently_c15_mon/core/assets_manager.dart';
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: REdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: REdgeInsets.all(8),

      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.blue, width: 1),
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ImageAssets.meeting))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Column(
                children: [
                  Text("21", style: GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue
                  ),),
                  Text("Nov", style: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorsManager.blue
                  ),),

                ],
              ),
            ),
          ),

          SizedBox(height: 120.h),
          Card(

            child: Padding(
              padding:  REdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text("Meeting for Updating The Development Method ", style: Theme.of(context).textTheme.bodySmall,)),

                  Icon(Icons.favorite, color: ColorsManager.blue,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
