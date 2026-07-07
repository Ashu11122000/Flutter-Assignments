import '../../../data/models/calculator_history_model.dart';

class HistoryService {
  final List<CalculationHistoryModel> _history = [];

  List<CalculationHistoryModel> get history =>
      List.unmodifiable(_history);

  void addHistory(
    CalculationHistoryModel item,
  ) {
    _history.insert(0, item);
  }

  void removeHistory(
    CalculationHistoryModel item,
  ) {
    _history.remove(item);
  }

  void clearHistory() {
    _history.clear();
  }
}