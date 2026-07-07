import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/calculator_provider.dart';
import '../buttons/number_button.dart';
import '../buttons/operator_button.dart';
import 'keypad_grid.dart';

class BasicKeypad extends StatelessWidget {
  const BasicKeypad({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CalculatorProvider>();

    return KeypadGrid(
      columns: 4,
      children: [
        OperatorButton(
          text: 'AC',
          onPressed: provider.clear,
        ),

        OperatorButton(
          text: '⌫',
          onPressed: provider.backspace,
        ),

        OperatorButton(
          text: '%',
          onPressed: () => provider.append('%'),
        ),

        OperatorButton(
          text: '÷',
          onPressed: () => provider.append('÷'),
        ),

        NumberButton(
          text: '7',
          onPressed: () => provider.append('7'),
        ),

        NumberButton(
          text: '8',
          onPressed: () => provider.append('8'),
        ),

        NumberButton(
          text: '9',
          onPressed: () => provider.append('9'),
        ),

        OperatorButton(
          text: '×',
          onPressed: () => provider.append('×'),
        ),

        NumberButton(
          text: '4',
          onPressed: () => provider.append('4'),
        ),

        NumberButton(
          text: '5',
          onPressed: () => provider.append('5'),
        ),

        NumberButton(
          text: '6',
          onPressed: () => provider.append('6'),
        ),

        OperatorButton(
          text: '-',
          onPressed: () => provider.append('-'),
        ),

        NumberButton(
          text: '1',
          onPressed: () => provider.append('1'),
        ),

        NumberButton(
          text: '2',
          onPressed: () => provider.append('2'),
        ),

        NumberButton(
          text: '3',
          onPressed: () => provider.append('3'),
        ),

        OperatorButton(
          text: '+',
          onPressed: () => provider.append('+'),
        ),

        NumberButton(
          text: '+/-',
          onPressed: () {
            // Will be implemented during Calculator Engine phase.
          },
        ),

        NumberButton(
          text: '0',
          onPressed: () => provider.append('0'),
        ),

        NumberButton(
          text: '.',
          onPressed: () => provider.append('.'),
        ),

        OperatorButton(
          text: '=',
          onPressed: provider.calculate,
        ),
      ],
    );
  }
}