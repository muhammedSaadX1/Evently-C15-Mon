import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/features/main_layout/home/category_item.dart';
import 'package:evently_c15_mon/features/main_layout/home/event_item.dart';
import 'package:evently_c15_mon/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [
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
  int selectedIndexTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: REdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
          child: SafeArea(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back ✨",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorsManager.white,
                            ),
                          ),
                          Text(
                            "Muhammed Saad",
                            style: GoogleFonts.inter(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorsManager.white,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: ColorsManager.white,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "Cairo, Egypt",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorsManager.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.light_mode, color: ColorsManager.white),
                      Card(
                        child: Padding(
                          padding: REdgeInsets.all(8.0),
                          child: Text(
                            "En",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: ColorsManager.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  DefaultTabController(
                    length: categories.length,
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
                          categories.map((category) {
                            print(categories.indexOf(category));
                            return CategoryItem(
                              category: category,
                              selectedBackgroundColor: ColorsManager.whiteBlue,
                              unSelectedBackgroundColor: Colors.transparent,
                              selectedForegroundColor: ColorsManager.blue,
                              unSelectedForegroundColor:
                                  ColorsManager.whiteBlue,
                              isSelected:
                                  categories.indexOf(category) ==
                                  selectedIndexTab,
                            );
                          }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  Expanded(child: ListView.builder(itemBuilder: (context, index) => EventItem(),itemCount: 20,))
      ],
    );
  }
}
