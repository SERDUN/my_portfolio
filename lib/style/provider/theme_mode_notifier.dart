import 'package:flutter/material.dart';

class ThemeModelNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void changeThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
