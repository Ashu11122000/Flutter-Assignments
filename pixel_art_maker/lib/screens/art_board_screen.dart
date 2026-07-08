import 'package:flutter/material.dart';

class ArtBoardScreen extends StatefulWidget {
  const ArtBoardScreen({Key? key}) : super(key: key);

  @override
  _ArtBoardScreenState createState() => _ArtBoardScreenState();
}

class _ArtBoardScreenState extends State<ArtBoardScreen> {
  // Grid settings
  final int _gridSize = 16; // A 16x16 pixel grid
  late List<Color> _pixelColors;

  // Palette settings
  Color _selectedColor = Colors.black;
  final List<Color> _paletteColors = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.brown,
    Colors.pink,
    Colors.white, // Used as an eraser
  ];

  @override
  void initState() {
    super.initState();
    _initializeGrid();
  }

  void _initializeGrid() {
    // Populate the array with white colors to represent a blank canvas
    _pixelColors = List<Color>.generate(
      _gridSize * _gridSize,
      (index) => Colors.white,
    );
  }

  void _clearBoard() {
    setState(() {
      _initializeGrid();
    });
  }

  void _updatePixel(int index) {
    setState(() {
      _pixelColors[index] = _selectedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixel Art Maker'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Clear Board',
            onPressed: _clearBoard,
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // The Drawing Grid
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1, // Keeps the grid perfectly square
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(), // Prevents scrolling issues while tapping
                    itemCount: _gridSize * _gridSize,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _gridSize,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _updatePixel(index),
                        // onPanUpdate allows users to click and drag to draw continuously
                        onPanUpdate: (details) => _updatePixel(index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _pixelColors[index],
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 0.5,
                            ), // Creates the subtle pixel grid lines
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          const Text(
            'Color Palette',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          
          // The Color Palette Selector
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _paletteColors.length,
              itemBuilder: (context, index) {
                final color = _paletteColors[index];
                final isSelected = _selectedColor == color;
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                  child: Container(
                    width: 50,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.blueAccent : Colors.grey.shade300,
                        width: isSelected ? 4 : 2,
                      ),
                      boxShadow: isSelected
                          ? [const BoxShadow(color: Colors.black26, blurRadius: 4)]
                          : null,
                    ),
                    // Add an icon to the white color to indicate it's an eraser
                    child: color == Colors.white
                        ? Icon(Icons.cleaning_services, color: Colors.grey.shade400, size: 20)
                        : null,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}