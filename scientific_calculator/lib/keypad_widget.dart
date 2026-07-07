import 'package:flutter/material.dart';

class KeypadWidget extends StatelessWidget {
  final Function(String) onButtonPressed;

  // The layout of your scientific calculator buttons
  final List<String> buttons = [
    'C', 'sin', 'cos', 'tan',
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    '.', '0', '=', '+'
  ];

  KeypadWidget({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: buttons.length,
      // Creates a grid with 4 columns
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, 
        childAspectRatio: 1.2, // Adjusts button height/width ratio
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: _isOperator(buttons[index]) 
                  ? Colors.blueAccent 
                  : Colors.grey[800],
            ),
            onPressed: () => onButtonPressed(buttons[index]),
            child: Text(
              buttons[index], 
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // Helper function to color operator buttons differently
  bool _isOperator(String x) {
    return x == '/' || x == '*' || x == '-' || x == '+' || x == '=' || 
          x == 'sin' || x == 'cos' || x == 'tan' || x == 'C';
  }
}