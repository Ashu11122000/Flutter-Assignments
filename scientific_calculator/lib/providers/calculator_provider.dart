import 'package:flutter/material.dart';

import '../core/enums/calculator_mode.dart';
import '../data/repositories/calculator_repository.dart';

class CalculatorProvider extends ChangeNotifier {
  CalculatorProvider({
    CalculatorRepository? repository,
  }) : _repository = repository ?? CalculatorRepository();

  // ===========================================================================
  // Repository
  // ===========================================================================

  final CalculatorRepository _repository;

  CalculatorRepository get repository => _repository;

  // ===========================================================================
  // State
  // ===========================================================================

  String _expression = '';

  String _result = '0';

  CalculatorMode _mode = CalculatorMode.scientific;

  bool _isDegreeMode = true;

  // ===========================================================================
  // Getters
  // ===========================================================================

  String get expression => _expression;

  String get result => _result;

  CalculatorMode get mode => _mode;

  bool get isDegreeMode => _isDegreeMode;

  // ===========================================================================
  // Expression
  // ===========================================================================

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

  // ===========================================================================
  // Result
  // ===========================================================================

  void setResult(String value) {
    _result = value;
    notifyListeners();
  }

  // ===========================================================================
  // Calculator Settings
  // ===========================================================================

  void changeMode(CalculatorMode mode) {
    if (_mode == mode) return;

    _mode = mode;
    notifyListeners();
  }

  void toggleAngleMode() {
    _isDegreeMode = !_isDegreeMode;
    notifyListeners();
  }

  // ===========================================================================
  // Memory
  // ===========================================================================

  double get memoryValue => _repository.memoryValue;

  bool get hasMemory => _repository.hasMemory;

  void memoryStore(double value) {
    _repository.memoryStore(value);
    notifyListeners();
  }

  void memoryAdd(double value) {
    _repository.memoryAdd(value);
    notifyListeners();
  }

  void memorySubtract(double value) {
    _repository.memorySubtract(value);
    notifyListeners();
  }

  double memoryRecall() {
    return _repository.memoryRecall();
  }

  void memoryClear() {
    _repository.memoryClear();
    notifyListeners();
  }

  // ===========================================================================
  // Calculator Engine
  // ===========================================================================

  /// The expression parser and scientific engine
  /// will be implemented in the Calculator Engine phase.
  void calculate() {
    notifyListeners();
  }
}