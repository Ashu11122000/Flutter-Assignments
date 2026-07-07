import 'package:flutter/material.dart';

class LightAppTheme {
  LightAppTheme._();

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: Colors.deepPurple,
    );
  }
}
