import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import 'calculator_button.dart';

class MemoryButton extends StatelessWidget {
  const MemoryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }
}