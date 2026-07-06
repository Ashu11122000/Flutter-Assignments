import 'package:flutter/material.dart';
// import 'counter_screen.dart'; // Importing our separated screen

void main() {
  runApp(const MyApp());
}

// The Root of your Application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const CounterScreen(), // Calling the screen from the imported file
      debugShowCheckedModeBanner: false,
    );
  }
}