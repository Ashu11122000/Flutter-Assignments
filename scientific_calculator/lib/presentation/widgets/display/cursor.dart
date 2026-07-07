import 'package:flutter/material.dart';

class Cursor extends StatefulWidget {
  const Cursor({super.key});

  @override
  State<Cursor> createState() => _CursorState();
}

class _CursorState extends State<Cursor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 2,
        height: 32,
        color: color,
      ),
    );
  }
}