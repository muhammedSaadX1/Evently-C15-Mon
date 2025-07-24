import 'package:evently_c15_mon/core/assets_manager.dart';
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/widgets/custom_elevated_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_tab_bar.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_form_field.dart';
import 'package:evently_c15_mon/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.create_event)),
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
                categories: CategoryModel.getCategories(context),
                selectedBackgroundColor: ColorsManager.blue,
                unSelectedBackgroundColor: Colors.transparent,
                selectedForegroundColor: ColorsManager.white,
                unSelectedForegroundColor: ColorsManager.blue,
              ),
              SizedBox(height: 16.h,),
              Text(appLocalizations.event_title),
              SizedBox(height: 8.h,),
              CustomTextFormField(prefixIcon: Icons.edit, hint: appLocalizations.event_title,),
              SizedBox(height: 16.h,),
              Text(appLocalizations.description),
              SizedBox(height: 8.h,),
              CustomTextFormField( hint: appLocalizations.event_description,maxLines: 4,),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Icon(Icons.date_range_rounded),
                  SizedBox(width: 8.w,),
                  Text(appLocalizations.event_date, style: Theme.of(context).textTheme
                    .bodySmall,),
                  Spacer(),
                  CustomTextButton(title:appLocalizations.choose_date, onPressed: (){
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
                  Text(appLocalizations.event_time, style: Theme.of(context).textTheme.bodySmall,),
                  Spacer(),
                  CustomTextButton(title: appLocalizations.choose_time, onPressed: (){
                    showTimePicker(context: context, initialTime: TimeOfDay.now());
                  }
                  ),

                ],
              ),
              SizedBox(height: 18,),
              CustomElevatedButton(title: appLocalizations.add_event)
            ],
          ),
        ),
      ),
    );
  }
}
