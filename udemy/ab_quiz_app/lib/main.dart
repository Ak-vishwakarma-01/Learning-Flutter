import 'package:ab_quiz_app/start_creen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 74, 11, 87),
              Color.fromARGB(255, 131, 22, 158)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
      ),
        child: const StartScreen(),
      ),
    ),
   ),
  );
}
