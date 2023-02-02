import 'package:flutter/material.dart';

class SettingsData with ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.light;

  ThemeMode get currentThemeMode => _currentTheme;

  bool isDarkMode() {
    return _currentTheme == ThemeMode.dark;
  }

  void toggleTheme(isOn) {
    _currentTheme = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
