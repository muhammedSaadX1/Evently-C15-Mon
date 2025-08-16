import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_form_field.dart';
import 'package:evently_c15_mon/features/main_layout/home/event_item.dart';
import 'package:evently_c15_mon/firebase_service/firebase_service.dart';
import 'package:evently_c15_mon/models/event_model.dart';
import 'package:evently_c15_mon/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:evently_c15_mon/l10n/app_localizations.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormField(
              hint: appLocalizations.search,
              prefixIcon: Icons.search,
              prefixIconColor: ColorsManager.blue,
            ),
            FutureBuilder(
              future: FirebaseService.getEventFromFireStore(),

              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                List<EventModel> favEvents =
                    snapshot.data
                        ?.where(
                          (event) => UserModel.currentUser!.favEventsIds
                              .contains(event.id),
                        )
                        .toList() ??
                    [];

                return Expanded(child: ListView.builder(itemBuilder: (context, index)=> EventItem(event: favEvents[index], isFav: true), itemCount: favEvents.length,));
              },
            ),
          ],
        ),
      ),
    );
  }
}
