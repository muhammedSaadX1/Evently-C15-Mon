import 'package:evently_c15_mon/config/theme/theme_manager.dart';
import 'package:evently_c15_mon/core/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const EventlyApp());
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManger.getRoute ,
        initialRoute: RoutesManger.login,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: ThemeMode.light,
        locale: Locale("en"),

      ),
    );
  }
}

