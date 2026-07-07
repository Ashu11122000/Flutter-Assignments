import 'package:flutter/material.dart';

import '../../core/enums/button_type.dart';
import '../../core/enums/operation_type.dart';

@immutable
class CalculatorButtonModel {
  final String text;
  final IconData? icon;
  final ButtonType type;
  final OperationType? operation;
  final bool enabled;

  const CalculatorButtonModel({
    required this.text,
    required this.type,
    this.icon,
    this.operation,
    this.enabled = true,
  });

  CalculatorButtonModel copyWith({
    String? text,
    IconData? icon,
    ButtonType? type,
    OperationType? operation,
    bool? enabled,
  }) {
    return CalculatorButtonModel(
      text: text ?? this.text,
      icon: icon ?? this.icon,
      type: type ?? this.type,
      operation: operation ?? this.operation,
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  String toString() {
    return '''
CalculatorButtonModel(
  text: $text,
  type: $type,
  operation: $operation,
  enabled: $enabled,
)
''';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CalculatorButtonModel &&
            runtimeType == other.runtimeType &&
            text == other.text &&
            icon == other.icon &&
            type == other.type &&
            operation == other.operation &&
            enabled == other.enabled;
  }

  @override
  int get hashCode =>
      Object.hash(text, icon, type, operation, enabled);
}