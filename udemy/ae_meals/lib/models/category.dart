import 'package:flutter/material.dart';

class Catogory {
  const Catogory({
    required this.id, 
    required this.title, 
    this.color = const Color.fromARGB(255, 0, 255, 94)}
  );

  final String id;
  final String title;
  final Color color;
}
