class BasicCalculatorService {
  const BasicCalculatorService();

  double add(
    double firstNumber,
    double secondNumber,
  ) {
    return firstNumber + secondNumber;
  }

  double subtract(
    double firstNumber,
    double secondNumber,
  ) {
    return firstNumber - secondNumber;
  }

  double multiply(
    double firstNumber,
    double secondNumber,
  ) {
    return firstNumber * secondNumber;
  }

  double divide(
    double firstNumber,
    double secondNumber,
  ) {
    if (secondNumber == 0) {
      throw Exception(
        'Cannot divide by zero.',
      );
    }

    return firstNumber / secondNumber;
  }

  double percentage(
    double number,
  ) {
    return number / 100;
  }

  double negate(
    double number,
  ) {
    return -number;
  }
}