import 'package:evently_c15_mon/core/assets_manager.dart';
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/widgets/custom_elevated_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_tab_bar.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_form_field.dart';
import 'package:evently_c15_mon/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Event")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(ImageAssets.meeting),
              ),
              SizedBox(height: 4.h),
              CustomTabBar(
                categories: CategoryModel.categories,
                selectedBackgroundColor: ColorsManager.blue,
                unSelectedBackgroundColor: Colors.transparent,
                selectedForegroundColor: ColorsManager.white,
                unSelectedForegroundColor: ColorsManager.blue,
              ),
              SizedBox(height: 16.h,),
              Text("Title"),
              SizedBox(height: 8.h,),
              CustomTextFormField(prefixIcon: Icons.edit, hint: "Event Title",),
              SizedBox(height: 16.h,),
              Text("Description"),
              SizedBox(height: 8.h,),
              CustomTextFormField( hint: "Event Description",maxLines: 4,),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Icon(Icons.date_range_rounded),
                  SizedBox(width: 8.w,),
                  Text("Event Date"),
                  Spacer(),
                  CustomTextButton(title: "Choose Date", onPressed: (){
                    showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 356)));
                  }
                  )
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Icon(Icons.access_time_outlined),
                  SizedBox(width: 8.w,),
                  Text("Event Time"),
                  Spacer(),
                  CustomTextButton(title: "Choose Time", onPressed: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.now());
                  }
                  ),

                ],
              ),
              SizedBox(height: 18,),
              CustomElevatedButton(title: "Add Event")
            ],
          ),
        ),
      ),
    );
  }
}
