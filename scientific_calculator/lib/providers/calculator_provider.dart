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

  bool get hasExpression => _expression.isNotEmpty;

  bool get hasResult => _result != '0';

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

  void appendOperator(String operator) {
    if (_expression.isEmpty) return;

    const operators = ['+', '-', '×', '÷', '%', '^'];

    if (operators.any((op) => _expression.endsWith(op))) {
      _expression =
          _expression.substring(0, _expression.length - 1) + operator;
    } else {
      _expression += operator;
    }

    notifyListeners();
  }

  void appendDecimal() {
    if (_expression.isEmpty) {
      _expression = '0.';
    } else if (!_expression.endsWith('.')) {
      _expression += '.';
    }

    notifyListeners();
  }

  void appendBracket(bool left) {
    _expression += left ? '(' : ')';
    notifyListeners();
  }

  void appendFunction(String function) {
    _expression += '$function(';
    notifyListeners();
  }

  void appendConstant(String constant) {
    _expression += constant;
    notifyListeners();
  }

  void toggleSign() {
    if (_expression.isEmpty) return;

    if (_expression.startsWith('-')) {
      _expression = _expression.substring(1);
    } else {
      _expression = '-$_expression';
    }

    notifyListeners();
  }

  void backspace() {
    if (_expression.isEmpty) return;

    _expression = _expression.substring(0, _expression.length - 1);
    notifyListeners();
  }

  void clearEntry() {
    if (_expression.isEmpty) return;

    _expression = '';
    notifyListeners();
  }

  void clear() {
    _expression = '';
    _result = '0';
    notifyListeners();
  }

  void reset() {
    _expression = '';
    _result = '0';
    _mode = CalculatorMode.scientific;
    _isDegreeMode = true;
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

  /// This method will delegate to CalculatorEngine in the next phase.
  void calculate() {
    notifyListeners();
  }
}