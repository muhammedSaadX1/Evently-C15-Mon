import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/widgets/custom_text_form_field.dart';
import 'package:evently_c15_mon/features/main_layout/home/event_item.dart';
import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormField(hint: "Search for Event",
            prefixIcon: Icons.search, prefixIconColor: ColorsManager.blue,
            ),
            Expanded(child: ListView.builder(itemBuilder: (context, index) => EventItem(),itemCount: 10,))

          ],
        ),
      ),
    );
  }
}
