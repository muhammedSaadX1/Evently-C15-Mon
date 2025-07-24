import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  String currentLang = "en";

  bool get isEnglish => currentLang == "en";
  void changeCurrentLang(String newLang){
    if(currentLang == newLang) return;
    currentLang = newLang;
    notifyListeners();
  }
}