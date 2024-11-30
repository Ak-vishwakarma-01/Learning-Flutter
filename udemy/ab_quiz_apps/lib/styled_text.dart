import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text,this.size,this.color, {this.backgroundColor,super.key,});

  final String text;
  final int size;
  final Color color;
  final Color? backgroundColor;  // the background color is optional orgument for the constructor

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size.toDouble(),
        fontWeight: FontWeight.w500,
        backgroundColor: backgroundColor,
      ),
    );
  }
}