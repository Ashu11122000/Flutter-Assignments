import 'package:flutter/foundation.dart';

@immutable
class CalculationHistoryModel {
  final String expression;
  final String result;
  final DateTime createdAt;

  const CalculationHistoryModel({
    required this.expression,
    required this.result,
    required this.createdAt,
  });

  CalculationHistoryModel copyWith({
    String? expression,
    String? result,
    DateTime? createdAt,
  }) {
    return CalculationHistoryModel(
      expression: expression ?? this.expression,
      result: result ?? this.result,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory CalculationHistoryModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CalculationHistoryModel(
      expression: json['expression'] as String,
      result: json['result'] as String,
      createdAt: DateTime.parse(
        json['createdAt'] as String,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'expression': expression,
      'result': result,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return '''
CalculationHistoryModel(
  expression: $expression,
  result: $result,
  createdAt: $createdAt,
)
''';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CalculationHistoryModel &&
            expression == other.expression &&
            result == other.result &&
            createdAt == other.createdAt;
  }

  @override
  int get hashCode =>
      Object.hash(expression, result, createdAt);
}