import 'package:evently_c15_mon/core/contant_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static String savedLang = "en";
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void setLanguage(String language) async {
    await prefs.setString(CacheConstant.languageKey, language);
  }

  static String? getLanguage()  {
  return prefs.getString(CacheConstant.languageKey);
  }
  
  
  static saveTheme(ThemeMode theme){
    if(theme == ThemeMode.light){
      prefs.setString(CacheConstant.themeKey, "light");
    }else{
      prefs.setString(CacheConstant.themeKey, "dark");
    }
  }

  static ThemeMode? getTheme(){
    String? savedTheme = prefs.getString(CacheConstant.themeKey);
    if(savedTheme == null){
      return null;
    }else{
      if(savedTheme == "light"){
        return ThemeMode.light;
      }else{
        return ThemeMode.dark;
      }
    }
  }
}
