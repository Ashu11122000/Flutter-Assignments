import 'package:flutter/material.dart';

import '../../../core/constants/app_dimensions.dart';

class KeypadGrid extends StatelessWidget {
  const KeypadGrid({
    super.key,
    required this.children,
    required this.columns,
    this.spacing = AppDimensions.sm,
    this.runSpacing = AppDimensions.sm,
    this.childAspectRatio = 1.15,
    this.shrinkWrap = true,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  /// Widgets to display inside the keypad.
  final List<Widget> children;

  /// Number of columns.
  final int columns;

  /// Horizontal spacing.
  final double spacing;

  /// Vertical spacing.
  final double runSpacing;

  /// Width / Height ratio of each button.
  final double childAspectRatio;

  /// Whether GridView should size itself.
  final bool shrinkWrap;

  /// Scroll physics.
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: EdgeInsets.zero,
      itemCount: children.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (_, index) => children[index],
    );
  }
}