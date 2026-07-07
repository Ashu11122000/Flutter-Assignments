import 'package:flutter/material.dart';

class CriteriaSelector extends StatelessWidget {
  final double length;
  final ValueChanged<double> onLengthChanged;
  
  final bool hasUppercase;
  final ValueChanged<bool?> onUppercaseChanged;
  
  final bool hasLowercase;
  final ValueChanged<bool?> onLowercaseChanged;
  
  final bool hasNumbers;
  final ValueChanged<bool?> onNumbersChanged;
  
  final bool hasSymbols;
  final ValueChanged<bool?> onSymbolsChanged;

  const CriteriaSelector({
    super.key,
    required this.length,
    required this.onLengthChanged,
    required this.hasUppercase,
    required this.onUppercaseChanged,
    required this.hasLowercase,
    required this.onLowercaseChanged,
    required this.hasNumbers,
    required this.onNumbersChanged,
    required this.hasSymbols,
    required this.onSymbolsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password Length: ${length.toInt()}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Slider(
          value: length,
          min: 6,
          max: 32,
          divisions: 26,
          label: length.round().toString(),
          onChanged: onLengthChanged,
        ),
        const Divider(),
        CheckboxListTile(
          title: const Text('Uppercase Letters (A-Z)'),
          value: hasUppercase,
          onChanged: onUppercaseChanged,
        ),
        CheckboxListTile(
          title: const Text('Lowercase Letters (a-z)'),
          value: hasLowercase,
          onChanged: onLowercaseChanged,
        ),
        CheckboxListTile(
          title: const Text('Numbers (0-9)'),
          value: hasNumbers,
          onChanged: onNumbersChanged,
        ),
        CheckboxListTile(
          title: const Text('Symbols (!@#\$%)'),
          value: hasSymbols,
          onChanged: onSymbolsChanged,
        ),
      ],
    );
  }
}