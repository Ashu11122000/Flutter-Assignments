import 'package:flutter/material.dart';

import '../core/enums/calculator_mode.dart';

class CalculatorProvider extends ChangeNotifier {
  CalculatorProvider();

  // ==========================
  // State
  // ==========================

  String _expression = '';
  String _result = '0';

  CalculatorMode _mode = CalculatorMode.scientific;

  bool _isDegreeMode = true;

  // ==========================
  // Getters
  // ==========================

  String get expression => _expression;

  String get result => _result;

  CalculatorMode get mode => _mode;

  bool get isDegreeMode => _isDegreeMode;

  // ==========================
  // Expression Methods
  // ==========================

  void setExpression(String value) {
    _expression = value;
    notifyListeners();
  }

  void append(String value) {
    _expression += value;
    notifyListeners();
  }

  void backspace() {
    if (_expression.isEmpty) return;

    _expression = _expression.substring(0, _expression.length - 1);
    notifyListeners();
  }

  void clear() {
    _expression = '';
    _result = '0';
    notifyListeners();
  }

  // ==========================
  // Result Methods
  // ==========================

  void setResult(String value) {
    _result = value;
    notifyListeners();
  }

  // ==========================
  // Calculator Settings
  // ==========================

  void changeMode(CalculatorMode mode) {
    if (_mode == mode) return;

    _mode = mode;
    notifyListeners();
  }

  void toggleAngleMode() {
    _isDegreeMode = !_isDegreeMode;
    notifyListeners();
  }

  // ==========================
  // Calculator Engine
  // ==========================

  /// Placeholder.
  /// The calculation logic will be implemented in the
  /// Calculator Engine phase.
  void calculate() {
    notifyListeners();
  }
}