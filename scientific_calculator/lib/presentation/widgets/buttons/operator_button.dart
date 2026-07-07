import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import 'calculator_button.dart';

class OperatorButton extends StatelessWidget {
  const OperatorButton({
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
      backgroundColor: AppColors.operatorButton,
      foregroundColor: Colors.white,
    );
  }
}