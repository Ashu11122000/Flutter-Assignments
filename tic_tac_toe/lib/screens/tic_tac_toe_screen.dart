import 'package:flutter/material.dart';

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({Key? key}) : super(key: key);

  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  // A 1D array of 9 elements represents our 3x3 board
  late List<String> _board;
  bool _isPlayerXTurn = true;
  String _winner = '';
  int _movesCount = 0;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    setState(() {
      _board = List.filled(9, '');
      _isPlayerXTurn = true;
      _winner = '';
      _movesCount = 0;
    });
  }

  void _handleTap(int index) {
    // Ignore tap if the square is already filled or the game is over
    if (_board[index] != '' || _winner != '') return;

    setState(() {
      _board[index] = _isPlayerXTurn ? 'X' : 'O';
      _isPlayerXTurn = !_isPlayerXTurn;
      _movesCount++;
      _checkWinCondition();
    });
  }

  void _checkWinCondition() {
    // The 8 possible winning index combinations in a 3x3 grid
    const List<List<int>> winningLines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6]             // Diagonals
    ];

    for (var line in winningLines) {
      String a = _board[line[0]];
      String b = _board[line[1]];
      String c = _board[line[2]];

      if (a != '' && a == b && a == c) {
        _winner = a;
        return;
      }
    }

    // Check for a draw
    if (_movesCount == 9 && _winner == '') {
      _winner = 'Draw';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        centerTitle: true,
      ),
      // Center keeps it in the middle of wide desktop screens
      body: Center(
        // SingleChildScrollView prevents vertical overflow on shorter windows
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              
              // Game Status Indicator
              Text(
                _winner == ''
                    ? 'Current Turn: ${_isPlayerXTurn ? "X" : "O"}'
                    : _winner == 'Draw'
                        ? 'It\'s a Draw!'
                        : 'Player $_winner Wins!',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),

              // ConstrainedBox prevents the board from expanding infinitely on web/desktop
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 450),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: AspectRatio(
                    aspectRatio: 1, // Keep it square
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 9,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _handleTap(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                _board[index],
                                style: TextStyle(
                                  fontSize: 72,
                                  fontWeight: FontWeight.bold,
                                  color: _board[index] == 'X'
                                      ? Colors.blueAccent
                                      : Colors.redAccent,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Reset Button
              ElevatedButton.icon(
                onPressed: _initializeGame,
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Game'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}