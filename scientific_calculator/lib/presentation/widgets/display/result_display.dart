import 'package:flutter/material.dart';

import '../../../core/constants/app_text_styles.dart';

class ResultDisplay extends StatelessWidget {
  const ResultDisplay({
    super.key,
    required this.result,
  });

  final String result;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        child: Text(
          result,
          textAlign: TextAlign.end,
          style: AppTextStyles.result.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}