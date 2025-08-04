import 'package:evently_c15_mon/core/prefs_manager/prefs_manager.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode currentTheme = PrefsManager.getTheme() ?? ThemeMode.light;

  void changeAppTheme(ThemeMode newTheme){
    if(currentTheme == newTheme) return;
    currentTheme = newTheme;
    PrefsManager.saveTheme(currentTheme);

    notifyListeners();
  }


  bool get isDark => currentTheme == ThemeMode.dark;





}