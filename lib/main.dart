
import 'package:evently_c15_mon/config/theme/theme_manager.dart';
import 'package:evently_c15_mon/core/prefs_manager/prefs_manager.dart';
import 'package:evently_c15_mon/core/routes_manager.dart';
import 'package:evently_c15_mon/firebase_options.dart';
import 'package:evently_c15_mon/firebase_service/firebase_service.dart';
import 'package:evently_c15_mon/models/user_model.dart';
import 'package:evently_c15_mon/providers/config_provider.dart';
import 'package:evently_c15_mon/providers/language_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
UserModel.currentUser = await FirebaseService.getUserFromFireStore(FirebaseAuth.instance.currentUser?.uid?? "11") ;
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
              initialRoute: FirebaseAuth.instance.currentUser!= null ?RoutesManger.mainLayout : RoutesManger.login,
              theme: ThemeManager.light,
              darkTheme: ThemeManager.dark,
              themeMode: PrefsManager.getTheme() ?? ThemeMode.light,
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
      locale: Locale(PrefsManager.getLanguage() ??"en"),


    ),);
  }



}

