import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 30), // Adds breathing room between text and the box
            
            // The new "Box Form" UI layout
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest, // Soft background color
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Keeps the box wrapped tightly around the buttons/text
                children: [
                  
                  // 1. Increment Button (+)
                  IconButton(
                    onPressed: _incrementCounter,
                    icon: const Icon(Icons.add),
                    tooltip: 'Increment',
                    style: IconButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  
                  const SizedBox(width: 32), // Spacing between button and text
                  
                  // 2. Counter Text (0)
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(width: 32), // Spacing between text and button
                  
                  // 3. Decrement Button (-)
                  IconButton(
                    onPressed: _decrementCounter,
                    icon: const Icon(Icons.remove),
                    tooltip: 'Decrement',
                    style: IconButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}