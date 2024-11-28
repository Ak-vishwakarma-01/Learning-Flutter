import 'package:aa_first/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(colors: [Color.fromARGB(255, 7, 58, 100),Color.fromARGB(255, 12, 77, 131)]), 
        ),
    ),
  );
}


