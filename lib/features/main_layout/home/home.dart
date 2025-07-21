import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/core/widgets/category_item.dart';
import 'package:evently_c15_mon/core/widgets/custom_tab_bar.dart';
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


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: REdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
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
                            style:Theme.of(context).textTheme.titleSmall
                          ),
                          Text(
                            "Muhammed Saad",
                            style:Theme.of(context).textTheme.titleMedium
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: ColorsManager.white ,

                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "Cairo, Egypt",
                                style: Theme.of(context).textTheme.titleSmall
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.light_mode,color: ColorsManager.white,),
                      Card(
                        color: Theme.of(context).cardColor,
                        child: Padding(
                          padding: REdgeInsets.all(8.0),
                          child: Text(
                            "En",
                            style: Theme.of(context).textTheme.displaySmall
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  CustomTabBar(categories: CategoryModel.categoriesWithAll,
                      selectedBackgroundColor: ColorsManager.whiteBlue,
                      unSelectedBackgroundColor: Colors.transparent,
                      selectedForegroundColor: ColorsManager.blue,
                      unSelectedForegroundColor: ColorsManager.whiteBlue
                       ,),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: ListView.builder(
          itemBuilder: (context, index) => EventItem(), itemCount: 20,))
      ],
    );
  }
}
