import 'package:flutter/material.dart';
import '../widgets/password_display.dart';
import '../widgets/criteria_selector.dart';
import '../utils/password_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _generatedPassword = '';
  double _passwordLength = 12;
  bool _hasUppercase = true;
  bool _hasLowercase = true;
  bool _hasNumbers = true;
  bool _hasSymbols = false;

  void _generateNewPassword() {
    setState(() {
      _generatedPassword = PasswordLogic.generatePassword(
        length: _passwordLength,
        hasUppercase: _hasUppercase,
        hasLowercase: _hasLowercase,
        hasNumbers: _hasNumbers,
        hasSymbols: _hasSymbols,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Generator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PasswordDisplay(password: _generatedPassword),
            const SizedBox(height: 30),
            CriteriaSelector(
              length: _passwordLength,
              onLengthChanged: (val) => setState(() => _passwordLength = val),
              hasUppercase: _hasUppercase,
              onUppercaseChanged: (val) => setState(() => _hasUppercase = val ?? false),
              hasLowercase: _hasLowercase,
              onLowercaseChanged: (val) => setState(() => _hasLowercase = val ?? false),
              hasNumbers: _hasNumbers,
              onNumbersChanged: (val) => setState(() => _hasNumbers = val ?? false),
              hasSymbols: _hasSymbols,
              onSymbolsChanged: (val) => setState(() => _hasSymbols = val ?? false),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _generateNewPassword,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: const Text('Generate Password'),
            ),
          ],
        ),
      ),
    );
  }
}