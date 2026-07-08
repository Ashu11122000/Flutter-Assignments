import 'package:flutter/material.dart';

import 'calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController number1Controller = TextEditingController();
  final TextEditingController number2Controller = TextEditingController();

  String result = "0";

  void calculate(String operation) {
    final double? num1 = double.tryParse(number1Controller.text);
    final double? num2 = double.tryParse(number2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        result = "Please enter valid numbers";
      });
      return;
    }

    double answer;

    switch (operation) {
      case "+":
        answer = num1 + num2;
        break;

      case "-":
        answer = num1 - num2;
        break;

      case "×":
        answer = num1 * num2;
        break;

      case "÷":
        if (num2 == 0) {
          setState(() {
            result = "Cannot divide by zero";
          });
          return;
        }
        answer = num1 / num2;
        break;

      default:
        answer = 0;
    }

    setState(() {
      result = answer.toString();
    });
  }

  @override
  void dispose() {
    number1Controller.dispose();
    number2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: number1Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: "First Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: number2Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: "Second Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                CalculatorButton(
                  text: "+",
                  onPressed: () => calculate("+"),
                ),
                CalculatorButton(
                  text: "-",
                  onPressed: () => calculate("-"),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                CalculatorButton(
                  text: "×",
                  onPressed: () => calculate("×"),
                ),
                CalculatorButton(
                  text: "÷",
                  onPressed: () => calculate("÷"),
                ),
              ],
            ),
            const SizedBox(height: 35),
            const Text(
              "Result",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}