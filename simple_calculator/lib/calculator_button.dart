import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}