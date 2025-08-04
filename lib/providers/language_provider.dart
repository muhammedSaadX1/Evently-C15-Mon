import 'package:evently_c15_mon/core/prefs_manager/prefs_manager.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLang = PrefsManager.getLanguage() ?? "en";

  bool get isEnglish => currentLang == "en";

  void changeCurrentLang(String newLang) async {
    if (currentLang == newLang) return;
    currentLang = newLang; // ar
    PrefsManager.setLanguage(currentLang);
    notifyListeners();
  }
}
