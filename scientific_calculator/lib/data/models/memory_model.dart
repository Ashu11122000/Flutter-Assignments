import 'package:flutter/foundation.dart';

@immutable
class MemoryModel {
  final double value;

  const MemoryModel({
    this.value = 0,
  });

  bool get hasValue => value != 0;

  MemoryModel copyWith({
    double? value,
  }) {
    return MemoryModel(
      value: value ?? this.value,
    );
  }

  factory MemoryModel.empty() {
    return const MemoryModel();
  }

  @override
  String toString() {
    return 'MemoryModel(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is MemoryModel &&
            value == other.value;
  }

  @override
  int get hashCode => value.hashCode;
}