import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsProvider extends ChangeNotifier {
 String currentLang = 'en';
 ThemeMode currentTheme =ThemeMode.light;


 void changeTheme(ThemeMode newTheme) async{

if(newTheme == currentTheme){
  return ;
}
// Obtain shared preferences.
   final prefs = await SharedPreferences.getInstance();
currentTheme = newTheme ;
prefs.setString('theme', newTheme==ThemeMode.light? 'light': 'dark');
notifyListeners();
 }



  void changeLanguage(String newLang) async {
    if(newLang==currentLang){
      return;
  }
    // Obtain shared preferences.
     final prefs = await SharedPreferences.getInstance();
    currentLang = newLang;
    prefs.setString('language', newLang);
    notifyListeners();

  }
  bool isDarkMode(){
   return currentTheme == ThemeMode.dark;
  }
  String getMainBackGround(){
   return isDarkMode()?
   'assets/images/main_dark.png':
   'assets/images/bg3.png';

 }
}
