import 'package:flutter/material.dart';

import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_text_styles.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    this.icon,
    this.elevation = 0,
    this.enabled = true,
  });

  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;

  final Color backgroundColor;
  final Color foregroundColor;

  final double elevation;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimensions.buttonHeight,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.buttonRadius,
            ),
          ),
        ),
        child: icon != null
            ? Icon(
                icon,
                size: AppDimensions.iconMedium,
              )
            : Text(
                text,
                style: AppTextStyles.button.copyWith(
                  color: foregroundColor,
                ),
              ),
      ),
    );
  }
}