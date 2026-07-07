import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import 'calculator_button.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
      text: text,
      onPressed: onPressed,
      enabled: enabled,
      backgroundColor: AppColors.numberButton,
      foregroundColor: Colors.white,
    );
  }
}