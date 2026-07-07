import '../../core/services/calculator/basic_calculator_service.dart';
import '../../core/services/calculator/history_service.dart';
import '../../core/services/calculator/memory_service.dart';
import '../../core/services/calculator/scientific_calculator_service.dart';
import '../../core/services/storage/storage_service.dart';
import '../models/calculator_history_model.dart';

class CalculatorRepository {
  CalculatorRepository({
    BasicCalculatorService? basicCalculatorService,
    ScientificCalculatorService? scientificCalculatorService,
    MemoryService? memoryService,
    HistoryService? historyService,
    StorageService? storageService,
  })  : _basicCalculatorService =
            basicCalculatorService ?? const BasicCalculatorService(),
        _scientificCalculatorService =
            scientificCalculatorService ??
                const ScientificCalculatorService(),
        _memoryService = memoryService ?? MemoryService(),
        _historyService = historyService ?? HistoryService(),
        _storageService = storageService ?? StorageService();

  // ---------------------------------------------------------------------------
  // Services
  // ---------------------------------------------------------------------------

  final BasicCalculatorService _basicCalculatorService;
  final ScientificCalculatorService _scientificCalculatorService;
  final MemoryService _memoryService;
  final HistoryService _historyService;
  final StorageService _storageService;

  // ===========================================================================
  // Basic Calculator
  // ===========================================================================

  double add(double firstNumber, double secondNumber) {
    return _basicCalculatorService.add(firstNumber, secondNumber);
  }

  double subtract(double firstNumber, double secondNumber) {
    return _basicCalculatorService.subtract(firstNumber, secondNumber);
  }

  double multiply(double firstNumber, double secondNumber) {
    return _basicCalculatorService.multiply(firstNumber, secondNumber);
  }

  double divide(double firstNumber, double secondNumber) {
    return _basicCalculatorService.divide(firstNumber, secondNumber);
  }

  double percentage(double value) {
    return _basicCalculatorService.percentage(value);
  }

  double negate(double value) {
    return _basicCalculatorService.negate(value);
  }

  // ===========================================================================
  // Scientific Calculator
  // ===========================================================================

  double square(double value) {
    return _scientificCalculatorService.square(value);
  }

  double cube(double value) {
    return _scientificCalculatorService.cube(value);
  }

  double power(double base, double exponent) {
    return _scientificCalculatorService.power(base, exponent);
  }

  double squareRoot(double value) {
    return _scientificCalculatorService.squareRoot(value);
  }

  double cubeRoot(double value) {
    return _scientificCalculatorService.cubeRoot(value);
  }

  double reciprocal(double value) {
    return _scientificCalculatorService.reciprocal(value);
  }

  double factorial(int value) {
    return _scientificCalculatorService.factorial(value);
  }

  // ===========================================================================
  // Memory
  // ===========================================================================

  double get memoryValue => _memoryService.memory;

  bool get hasMemory => memoryValue != 0;

  void memoryStore(double value) {
    _memoryService.store(value);
  }

  void memoryAdd(double value) {
    _memoryService.add(value);
  }

  void memorySubtract(double value) {
    _memoryService.subtract(value);
  }

  double memoryRecall() {
    return _memoryService.recall();
  }

  void memoryClear() {
    _memoryService.clear();
  }

  // ===========================================================================
  // History
  // ===========================================================================

  List<CalculationHistoryModel> get history {
    return _historyService.history;
  }

  void addHistory(CalculationHistoryModel item) {
    _historyService.addHistory(item);
  }

  void removeHistory(CalculationHistoryModel item) {
    _historyService.removeHistory(item);
  }

  void clearHistory() {
    _historyService.clearHistory();
  }

  // ===========================================================================
  // Storage
  // ===========================================================================

  Future<void> saveTheme(bool isDark) {
    return _storageService.saveTheme(isDark);
  }

  Future<bool> loadTheme() {
    return _storageService.loadTheme();
  }
}