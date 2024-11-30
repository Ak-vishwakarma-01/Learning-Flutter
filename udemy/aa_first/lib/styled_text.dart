import 'package:flutter/material.dart';

class StyledText extends StatelessWidget{
  const StyledText(this.text , this.size, this.color ,{super.key});
  
   final String text;
   final int size;
   final Color color;
  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size.toDouble(),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}