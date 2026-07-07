import 'package:flutter/material.dart';

import '../../../core/constants/app_dimensions.dart';
import 'cursor.dart';
import 'expression_display.dart';
import 'result_display.dart';

class DisplayContainer extends StatelessWidget {
  const DisplayContainer({
    super.key,
    required this.expression,
    required this.result,
    this.showCursor = true,
  });

  final String expression;
  final String result;
  final bool showCursor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      height: AppDimensions.displayHeight,
      padding: const EdgeInsets.all(AppDimensions.md),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusLarge,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: ExpressionDisplay(
                expression: expression,
              ),
            ),
          ),

          const SizedBox(
            height: AppDimensions.sm,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ResultDisplay(
                  result: result,
                ),
              ),

              if (showCursor) ...[
                const SizedBox(
                  width: AppDimensions.xs,
                ),
                const Cursor(),
              ],
            ],
          ),
        ],
      ),
    );
  }
}