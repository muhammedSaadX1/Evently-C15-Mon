import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/widgets/category_item.dart';
import 'package:evently_c15_mon/models/category_model.dart';

import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.categories,
    required this.selectedBackgroundColor,
    required this.unSelectedBackgroundColor,
    required this.selectedForegroundColor,
    required this.unSelectedForegroundColor,

  });

  final List<CategoryModel> categories;
  final Color selectedBackgroundColor;
  final Color unSelectedBackgroundColor;
  final Color selectedForegroundColor;
  final Color unSelectedForegroundColor;


  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndexTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            selectedIndexTab = index;
          });
        },
        isScrollable: true,
        tabs:
            widget.categories.map((category) {
              print(widget.categories.indexOf(category));
              return CategoryItem(
                category: category,
                selectedBackgroundColor: widget.selectedBackgroundColor,
                unSelectedBackgroundColor: widget.unSelectedBackgroundColor,
                selectedForegroundColor: widget.selectedForegroundColor,
                unSelectedForegroundColor: widget.unSelectedForegroundColor,
                isSelected:
                    widget.categories.indexOf(category) == selectedIndexTab,
              );
            }).toList(),
      ),
    );
  }
}
