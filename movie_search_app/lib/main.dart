import 'package:flutter/material.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(const MovieSearchApp());
}

class MovieSearchApp extends StatelessWidget {
  const MovieSearchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Search Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const SearchScreen(),
    );
  }
}