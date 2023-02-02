import 'package:flutter/material.dart';

class SettingsData with ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.light;

  ThemeMode get currentThemeMode => _currentTheme;

  Locale _currentLocale = Locale('nl');

  Locale get currentLocale => _currentLocale;

  bool isDarkMode() {
    return _currentTheme == ThemeMode.dark;
  }

  void toggleTheme(isOn) {
    _currentTheme = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }
}
