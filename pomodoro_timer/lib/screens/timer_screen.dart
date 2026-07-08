import 'dart:async';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  // 25 minutes for work, 5 minutes for break
  static const int workTimeInSeconds = 25 * 60;
  static const int breakTimeInSeconds = 5 * 60;

  int _timeLeft = workTimeInSeconds;
  bool _isRunning = false;
  bool _isWorkMode = true; // true = Work, false = Break
  Timer? _timer;

  // Formats the raw seconds into MM:SS format
  String get _formattedTime {
    int minutes = _timeLeft ~/ 60;
    int seconds = _timeLeft % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    
    setState(() {
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          // Timer finished
          _timer!.cancel();
          _isRunning = false;
          // Automatically switch modes when time is up
          _switchMode();
        }
      });
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _timeLeft = _isWorkMode ? workTimeInSeconds : breakTimeInSeconds;
    });
  }

  void _switchMode() {
    _timer?.cancel();
    setState(() {
      _isWorkMode = !_isWorkMode;
      _isRunning = false;
      _timeLeft = _isWorkMode ? workTimeInSeconds : breakTimeInSeconds;
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Always clean up your timers!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic colors based on the current mode
    Color primaryColor = _isWorkMode ? Colors.redAccent : Colors.teal;
    Color backgroundColor = _isWorkMode ? Colors.red.shade50 : Colors.teal.shade50;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Pomodoro Timer'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      // Layout fixes for Web/Desktop
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Mode Selector Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildModeButton('Work', true, primaryColor),
                      const SizedBox(width: 16),
                      _buildModeButton('Break', false, primaryColor),
                    ],
                  ),
                  const SizedBox(height: 60),

                  // The Countdown Display
                  Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        )
                      ],
                    ),
                    child: Text(
                      _formattedTime,
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),

                  // Timer Controls (Start/Pause & Reset)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Start / Pause Toggle
                      FloatingActionButton.large(
                        onPressed: _isRunning ? _pauseTimer : _startTimer,
                        backgroundColor: primaryColor,
                        child: Icon(
                          _isRunning ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                      
                      // Reset Button
                      FloatingActionButton(
                        onPressed: _resetTimer,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.refresh,
                          color: primaryColor,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget to build the Work/Break toggle buttons cleanly
  Widget _buildModeButton(String title, bool isWorkButton, Color activeColor) {
    bool isSelected = _isWorkMode == isWorkButton;
    
    return ElevatedButton(
      onPressed: () {
        if (!isSelected) _switchMode();
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black87,
        backgroundColor: isSelected ? activeColor : Colors.grey.shade300,
        elevation: isSelected ? 4 : 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}