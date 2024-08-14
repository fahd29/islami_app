import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  SharedPreferences? prefs;

  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    setThemeToCash(newMode);
    notifyListeners();
  }

  Future setThemeToCash(ThemeMode newMode) async {
    prefs = await SharedPreferences.getInstance();
    String themeName = newMode == ThemeMode.light ? 'light' : 'dark';

    await prefs!.setString('theme', themeName);
  }

  loadTheme() async {
    prefs = await SharedPreferences.getInstance();
    final String? themeName = prefs!.getString('theme');
    if (themeName != null) {
      appTheme = themeName == 'light' ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
  }
}
