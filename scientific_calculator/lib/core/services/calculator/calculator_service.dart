import 'basic_calculator_service.dart';
import 'history_service.dart';
import 'memory_service.dart';
import 'scientific_calculator_service.dart';

class CalculatorService {
  CalculatorService._();

  static const BasicCalculatorService basic =
      BasicCalculatorService();

  static const ScientificCalculatorService scientific =
      ScientificCalculatorService();

  static final MemoryService memory =
      MemoryService();

  static final HistoryService history =
      HistoryService();
}