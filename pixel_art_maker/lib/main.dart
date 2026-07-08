import 'package:flutter/material.dart';
import 'screens/art_board_screen.dart';

void main() {
  runApp(const PixelArtApp());
}

class PixelArtApp extends StatelessWidget {
  const PixelArtApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixel Art Maker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      home: const ArtBoardScreen(),
    );
  }
}