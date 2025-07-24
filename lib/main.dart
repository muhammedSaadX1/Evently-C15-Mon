import 'package:evently_c15_mon/config/theme/theme_manager.dart';
import 'package:evently_c15_mon/core/routes_manager.dart';
import 'package:evently_c15_mon/providers/config_provider.dart';
import 'package:evently_c15_mon/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(),),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: EventlyApp()));
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);
    return ScreenUtilInit(
      designSize: Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
          MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RoutesManger.getRoute,
              initialRoute: RoutesManger.mainLayout,
              theme: ThemeManager.light,
              darkTheme: ThemeManager.dark,
              themeMode:themeProvider.currentTheme,
              localizationsDelegates: [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
              Locale("en"),
      Locale("ar")
      ],
      locale: Locale(langProvider.currentLang),


    ),);
  }
}

