import 'package:evently_c15_mon/core/assets_manager.dart';
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/extensions/date_extension.dart';
import 'package:evently_c15_mon/core/extensions/time_extension.dart';
import 'package:evently_c15_mon/core/utils/dialog_utils.dart';
import 'package:evently_c15_mon/core/widgets/custom_elevated_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_tab_bar.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_button.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_form_field.dart';
import 'package:evently_c15_mon/firebase_service/firebase_service.dart';
import 'package:evently_c15_mon/models/category_model.dart';
import 'package:evently_c15_mon/models/event_model.dart';
import 'package:evently_c15_mon/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evently_c15_mon/l10n/app_localizations.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  CategoryModel selectedCategory = CategoryModel.categories[0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.create_event)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(ImageAssets.meeting),
                ),
                SizedBox(height: 4.h),
                CustomTabBar(
                  onCategoryItemClicked: (category){
                    selectedCategory = category;
                    setState(() {

                    });
                  },
                  categories: CategoryModel.getCategories(context),
                  selectedBackgroundColor: ColorsManager.blue,
                  unSelectedBackgroundColor: Colors.transparent,
                  selectedForegroundColor: ColorsManager.white,
                  unSelectedForegroundColor: ColorsManager.blue,
                ),
                SizedBox(height: 16.h),
                Text(appLocalizations.event_title),
                SizedBox(height: 8.h),
                CustomTextFormField(
                  validator: (input) {
                    if (input == null || input
                        .trim()
                        .isEmpty) {
                      return "Plz, enter event title";
                    }
                    return null;
                  },
                  controller: _titleController,
                  prefixIcon: Icons.edit,
                  hint: appLocalizations.event_title,
                ),
                SizedBox(height: 16.h),
                Text(appLocalizations.description),
                SizedBox(height: 8.h),
                CustomTextFormField(
                  validator: (input) {
                    if (input == null || input
                        .trim()
                        .isEmpty) {
                      return "Plz, enter event description";
                    }
                    return null;
                  },
                  controller: _descriptionController,
                  hint: appLocalizations.event_description,
                  maxLines: 4,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Icon(Icons.date_range_rounded),
                    SizedBox(width: 8.w),
                    Text(
                      selectedDate.toFormatDate,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,
                    ),
                    Spacer(),
                    CustomTextButton(
                      title: appLocalizations.choose_date,
                      onPressed: () {
                        chooseEventDate();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Icon(Icons.access_time_outlined),
                    SizedBox(width: 8.w),
                    Text(
                      selectedDate.formatTime,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,
                    ),
                    Spacer(),
                    CustomTextButton(
                      title: appLocalizations.choose_time,
                      onPressed: () {
                        chooseEventTime();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 18),
                CustomElevatedButton(
                  title: appLocalizations.add_event, onPress: _addEvent,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chooseEventDate() async {
    selectedDate =
        await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 356)),
        ) ??
            selectedDate;
    selectedDate = selectedDate.copyWith(
        hour: selectedTime.hour, minute: selectedTime.minute);
    print(selectedDate);
    setState(() {

    });
  }

  void chooseEventTime() async {
    selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
            selectedTime;
    selectedDate = selectedDate.copyWith(
        hour: selectedTime.hour, minute: selectedTime.minute);
    setState(() {

    });
  }

  void _addEvent() async{
    if (formKey.currentState!.validate() == false) return;

    EventModel event = EventModel(

        category: selectedCategory,
        title: _titleController.text,
        description: _descriptionController.text,
        dateTime: selectedDate,
        userId: UserModel.currentUser!.id);
    DialogUtils.showLoading(context);

    await FirebaseService.addEventToFireStore(event);
   // DialogUtils.hideDialog(context);
    DialogUtils.showMessage(context, message: "Event Created Successfully", posActionTitle: "Ok", posAction: (){
      Navigator.pop(context);

    });
  }
}
