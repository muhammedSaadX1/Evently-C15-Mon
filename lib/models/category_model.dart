import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final IconData icon;

  const CategoryModel({required this.name, required this.icon});

  static List<CategoryModel> categoriesWithAll = [
    CategoryModel(name: "All", icon: Icons.all_inclusive),
    CategoryModel(name: "Sports", icon: Icons.sports_football_rounded),
    CategoryModel(name: "Birthday", icon: Icons.cake_rounded),
    CategoryModel(name: "Meeting", icon: Icons.laptop),
    CategoryModel(name: "Gaming", icon: Icons.gamepad_rounded),
    CategoryModel(name: "Eating", icon: Icons.local_pizza_rounded),
    CategoryModel(name: "Holiday", icon: Icons.holiday_village_rounded),
    CategoryModel(name: "Exhibition", icon: Icons.water_drop_outlined),
    CategoryModel(name: "WorkShop", icon: Icons.workspaces_rounded),
    CategoryModel(name: "BookClub", icon: Icons.book_online),
  ];
  static List<CategoryModel> categories = [
    CategoryModel(name: "Sports", icon: Icons.sports_football_rounded),
    CategoryModel(name: "Birthday", icon: Icons.cake_rounded),
    CategoryModel(name: "Meeting", icon: Icons.laptop),
    CategoryModel(name: "Gaming", icon: Icons.gamepad_rounded),
    CategoryModel(name: "Eating", icon: Icons.local_pizza_rounded),
    CategoryModel(name: "Holiday", icon: Icons.holiday_village_rounded),
    CategoryModel(name: "Exhibition", icon: Icons.water_drop_outlined),
    CategoryModel(name: "WorkShop", icon: Icons.workspaces_rounded),
    CategoryModel(name: "BookClub", icon: Icons.book_online),
  ];
}
