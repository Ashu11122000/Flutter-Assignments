import 'package:flutter/material.dart';

import '../core/enums/theme_type.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeType _themeType = ThemeType.system;

  ThemeType get themeType => _themeType;

  ThemeMode get themeMode {
    switch (_themeType) {
      case ThemeType.light:
        return ThemeMode.light;

      case ThemeType.dark:
        return ThemeMode.dark;

      case ThemeType.system:
        return ThemeMode.system;
    }
  }

  void changeTheme(ThemeType themeType) {
    _themeType = themeType;

    notifyListeners();
  }

  bool get isDarkMode =>
      _themeType == ThemeType.dark;
}