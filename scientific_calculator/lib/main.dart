import 'package:flutter/material.dart';
// Import your custom widgets here!
import 'display_widget.dart';
import 'keypad_widget.dart';

void main() => runApp(const ScientificCalculatorApp());

class ScientificCalculatorApp extends StatelessWidget {
  const ScientificCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Type-Safe Calculator',
      theme: ThemeData.dark(),
      home: const CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _result = '0';

  // This function is passed down to the KeypadWidget
  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _input = '';
        _result = '0';
      } else if (buttonText == '=') {
        _calculateResult();
      } else {
        _input += buttonText;
      }
    });
  }

  void _calculateResult() {
    try {
      // TODO: Implement your type-safe calculation logic here.
      // If allowed, use the 'math_expressions' package to parse 
      // the _input string into a double safely.
      
      _result = "Success!"; // Placeholder
    } catch (e) {
      _result = "Format Error"; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scientific Calculator'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // 1. Use the DisplayWidget from display_widget.dart
          Expanded(
            flex: 1,
            child: DisplayWidget(input: _input, result: _result),
          ),
          
          const Divider(thickness: 2, height: 0),
          
          // 2. Use the KeypadWidget from keypad_widget.dart
          Expanded(
            flex: 2,
            child: KeypadWidget(onButtonPressed: _onButtonPressed),
          ),
        ],
      ),
    );
  }
}