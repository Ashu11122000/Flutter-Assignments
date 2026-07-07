import 'package:flutter/material.dart';

import 'routes.dart';
import 'themes/app_theme.dart';

class ScientificCalculatorApp extends StatelessWidget {
  const ScientificCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scientific Calculator',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

      initialRoute: AppRoutes.calculator,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
