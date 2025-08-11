import 'package:flutter/material.dart';
import 'package:quiz_app/screens/starting_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Color.fromARGB(255, 105, 28, 119),
                Color.fromARGB(255, 203, 40, 119),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const StartingScreen(),
        ),
      ),
    ),
  );
}