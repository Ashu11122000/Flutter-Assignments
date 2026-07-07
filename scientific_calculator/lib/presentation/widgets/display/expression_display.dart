import 'package:flutter/material.dart';

import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_text_styles.dart';

class ExpressionDisplay extends StatelessWidget {
  const ExpressionDisplay({
    super.key,
    required this.expression,
  });

  final String expression;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        child: Text(
          expression.isEmpty ? '0' : expression,
          textAlign: TextAlign.end,
          style: AppTextStyles.expression.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}