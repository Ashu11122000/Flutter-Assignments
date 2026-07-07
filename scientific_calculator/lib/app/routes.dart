import 'package:flutter/material.dart';

import '../presentation/screens/calculator_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String calculator = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case calculator:
        return MaterialPageRoute(builder: (_) => const CalculatorScreen());

      default:
        return MaterialPageRoute(builder: (_) => const CalculatorScreen());
    }
  }
}
