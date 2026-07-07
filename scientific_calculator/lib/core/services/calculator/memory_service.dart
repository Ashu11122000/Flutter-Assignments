class MemoryService {
  double _memory = 0;

  double get memory => _memory;

  void clear() {
    _memory = 0;
  }

  void store(
    double value,
  ) {
    _memory = value;
  }

  void add(
    double value,
  ) {
    _memory += value;
  }

  void subtract(
    double value,
  ) {
    _memory -= value;
  }

  double recall() {
    return _memory;
  }
}