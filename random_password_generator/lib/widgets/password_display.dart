import 'package:flutter/material.dart';

class PasswordDisplay extends StatelessWidget {
  final String password;

  const PasswordDisplay({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey.shade200),
      ),
      child: Text(
        password.isEmpty ? 'Your password will appear here' : password,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: password.isEmpty ? Colors.grey : Colors.black87,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}