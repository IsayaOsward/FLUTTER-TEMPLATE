import 'package:flutter/material.dart';

import '../../enums/app_theme.dart';

class ThemeController extends ChangeNotifier {
  AppThemeMode _themeMode = AppThemeMode.system;

  AppThemeMode get themeMode => _themeMode;

  ThemeMode get appThemeMode {
    switch (_themeMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
      return ThemeMode.system;
    }
  }

  void setTheme(AppThemeMode newMode) {
    if (newMode != _themeMode) {
      _themeMode = newMode;
      notifyListeners();
    }
  }
}
