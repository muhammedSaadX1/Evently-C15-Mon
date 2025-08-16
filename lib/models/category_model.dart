import 'package:flutter/material.dart';
import 'package:evently_c15_mon/l10n/app_localizations.dart';

class CategoryModel {
  final String id;
  final String name;
  final IconData icon;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  static List<CategoryModel> categoriesWithAll = [
    CategoryModel(id: "0", name: "All", icon: Icons.all_inclusive),
    CategoryModel(id: "1", name: "Sports", icon: Icons.sports_football_rounded),
    CategoryModel(id: "2", name: "Birthday", icon: Icons.cake_rounded),
    CategoryModel(id: "3", name: "Meeting", icon: Icons.laptop),
    CategoryModel(id: "4", name: "Gaming", icon: Icons.gamepad_rounded),
    CategoryModel(id: "5", name: "Eating", icon: Icons.local_pizza_rounded),
    CategoryModel(
      id: "6",
      name: "Holiday",
      icon: Icons.holiday_village_rounded,
    ),
    CategoryModel(id: "7", name: "Exhibition", icon: Icons.water_drop_outlined),
    CategoryModel(id: "8", name: "WorkShop", icon: Icons.workspaces_rounded),
    CategoryModel(id: "9", name: "BookClub", icon: Icons.book_online),
  ];
  static List<CategoryModel> categories = [
    CategoryModel(id: "1", name: "Sports", icon: Icons.sports_football_rounded),
    CategoryModel(id: "2", name: "Birthday", icon: Icons.cake_rounded),
    CategoryModel(id: "3", name: "Meeting", icon: Icons.laptop),
    CategoryModel(id: "4", name: "Gaming", icon: Icons.gamepad_rounded),
    CategoryModel(id: "5", name: "Eating", icon: Icons.local_pizza_rounded),
    CategoryModel(
      id: "6",
      name: "Holiday",
      icon: Icons.holiday_village_rounded,
    ),
    CategoryModel(id: "7", name: "Exhibition", icon: Icons.water_drop_outlined),
    CategoryModel(id: "8", name: "WorkShop", icon: Icons.workspaces_rounded),
    CategoryModel(id: "9", name: "BookClub", icon: Icons.book_online),
  ];

  static List<CategoryModel> getCategoriesWithAll(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return [
      CategoryModel(
        id: "0",
        name: appLocalizations.all,
        icon: Icons.all_inclusive,
      ),
      CategoryModel(
        id: "1",
        name: appLocalizations.sports,
        icon: Icons.sports_football_rounded,
      ),
      CategoryModel(
          id: "2",
          name: appLocalizations.birthday, icon: Icons.cake_rounded),
      CategoryModel(
          id: "3",
          name: appLocalizations.meeting, icon: Icons.laptop),
      CategoryModel(
          id: "4",
          name: appLocalizations.gaming, icon: Icons.gamepad_rounded),
      CategoryModel(
        id: "5",
        name: appLocalizations.eating,
        icon: Icons.local_pizza_rounded,
      ),
      CategoryModel(
        id: "6",
        name: appLocalizations.holiday,
        icon: Icons.holiday_village_rounded,
      ),
      CategoryModel(
        id: "7",
        name: appLocalizations.exhibition,
        icon: Icons.water_drop_outlined,
      ),
      CategoryModel(
        id: "8",
        name: appLocalizations.workshop,
        icon: Icons.workspaces_rounded,
      ),
      CategoryModel(
          id: "9",
          name: appLocalizations.book_club, icon: Icons.book_online),
    ];
  }

  static List<CategoryModel> getCategories(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return [

      CategoryModel(
        id: "1",
        name: appLocalizations.sports,
        icon: Icons.sports_football_rounded,
      ),
      CategoryModel(
          id: "2",
          name: appLocalizations.birthday, icon: Icons.cake_rounded),
      CategoryModel(
          id: "3",
          name: appLocalizations.meeting, icon: Icons.laptop),
      CategoryModel(
          id: "4",
          name: appLocalizations.gaming, icon: Icons.gamepad_rounded),
      CategoryModel(
        id: "5",
        name: appLocalizations.eating,
        icon: Icons.local_pizza_rounded,
      ),
      CategoryModel(
        id: "6",
        name: appLocalizations.holiday,
        icon: Icons.holiday_village_rounded,
      ),
      CategoryModel(
        id: "7",
        name: appLocalizations.exhibition,
        icon: Icons.water_drop_outlined,
      ),
      CategoryModel(
        id: "8",
        name: appLocalizations.workshop,
        icon: Icons.workspaces_rounded,
      ),
      CategoryModel(
          id: "9",
          name: appLocalizations.book_club, icon: Icons.book_online),
    ];
  }
}
