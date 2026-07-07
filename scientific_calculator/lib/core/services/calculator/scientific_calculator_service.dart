import 'dart:math' as math;

class ScientificCalculatorService {
  const ScientificCalculatorService();

  double square(
    double value,
  ) {
    return value * value;
  }

  double cube(
    double value,
  ) {
    return value * value * value;
  }

  double power(
    double base,
    double exponent,
  ) {
    return math.pow(base, exponent).toDouble();
  }

  double squareRoot(
    double value,
  ) {
    return math.sqrt(value);
  }

  double cubeRoot(
    double value,
  ) {
    return math.pow(value, 1 / 3).toDouble();
  }

  double reciprocal(
    double value,
  ) {
    if (value == 0) {
      throw Exception(
        'Cannot divide by zero.',
      );
    }

    return 1 / value;
  }

  double factorial(
    int value,
  ) {
    if (value < 0) {
      throw Exception(
        'Factorial is undefined.',
      );
    }

    double result = 1;

    for (int i = 1; i <= value; i++) {
      result *= i;
    }

    return result;
  }
}