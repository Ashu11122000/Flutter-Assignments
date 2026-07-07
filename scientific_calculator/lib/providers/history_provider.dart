import 'package:flutter/material.dart';
import 'package:scientific_calculator/core/services/calculator/history_service.dart';

import '../core/services/calculator/calculator_service.dart';
import '../data/models/calculator_history_model.dart';

class HistoryProvider extends ChangeNotifier {
  HistoryProvider();

  final HistoryService _historyService = CalculatorService.history;

  List<CalculationHistoryModel> get history =>
      _historyService.history;

  void addHistory(CalculationHistoryModel item) {
    _historyService.addHistory(item);

    notifyListeners();
  }

  void removeHistory(CalculationHistoryModel item) {
    _historyService.removeHistory(item);

    notifyListeners();
  }

  void clearHistory() {
    _historyService.clearHistory();

    notifyListeners();
  }
}