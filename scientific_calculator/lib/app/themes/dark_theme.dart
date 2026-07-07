import 'package:flutter/material.dart';

class DarkAppTheme {
  DarkAppTheme._();

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: Colors.deepPurple,
    );
  }
}