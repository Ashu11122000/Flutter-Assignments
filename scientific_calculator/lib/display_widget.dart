import 'package:flutter/material.dart';

class DisplayWidget extends StatelessWidget {
  final String input;
  final String result;

  const DisplayWidget({
    super.key, 
    required this.input, 
    required this.result
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Shows the equation being typed
          Text(
            input, 
            style: const TextStyle(fontSize: 28, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          // Shows the final calculated result
          Text(
            result, 
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}